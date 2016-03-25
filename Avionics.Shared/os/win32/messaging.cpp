#include "messaging.h"
#include <string.h>
#include "platform.h"
#include <TQueue.h>
#include <atomic>
#include "component_state.h"

#define MAX_NUM_CONSUMERS 20
#define MAX_NUM_PRODUCERS 20

#define MAX_NUM_TELEMETRY_REFS 1000

struct TelemetryRef {
    telemetry_t* packet;
    message_metadata_t flags;

    TelemetryRef(telemetry_t* packet, message_metadata_t flags) : packet(packet), flags(flags) {
    }

    ~TelemetryRef() {
        telemetry_allocator_free(packet);
    }
};

// This may be used for load tracking later on so is included
struct message_producer_impl_t {
    message_producer_t* parent;
};

struct message_consumer_impl_t {
    TQueue<std::shared_ptr<TelemetryRef>> mailbox;
    message_consumer_t* parent;
};

static std::atomic<uint32_t> cur_consumer_pool_index = 0;

static message_consumer_impl_t consumer_pool[MAX_NUM_CONSUMERS];

static std::mutex consumer_register_mutex;

static std::atomic<uint32_t> cur_producer_pool_index = 0;

static message_producer_impl_t producer_pool[MAX_NUM_PRODUCERS];

static std::mutex producer_register_mutex;

void init_messaging(void) {
    COMPONENT_STATE_UPDATE(avionics_component_messaging, state_ok);
}

// Initialise a producer - returns false on error
extern "C" bool messaging_producer_init(message_producer_t* producer) {
    std::lock_guard<std::mutex> lock(producer_register_mutex);
    if (producer->impl != nullptr)
        return true; // We assume it has already been initialised

    if (cur_producer_pool_index >= MAX_NUM_PRODUCERS) {
        COMPONENT_STATE_UPDATE(avionics_component_messaging, state_error);
        return false;
    }
    producer->impl = &producer_pool[cur_producer_pool_index];

    // Perform any initialisation
    producer->impl->parent = producer;
    telemetry_allocator_init(producer->telemetry_allocator);

    // Ensure all initialization has been completed before we increment the index
    std::atomic_thread_fence(std::memory_order_release);

    // We don't need the thread safe version
    // As stores are atomic and we only modify within this lock zone
    ++cur_producer_pool_index; // NB: this must be done after all initialization
    return true;
}

// Initialise a consumer - returns false on error
extern "C" bool messaging_consumer_init(message_consumer_t* consumer) {
    std::lock_guard<std::mutex> lock(consumer_register_mutex);
    if (consumer->impl != nullptr)
        return true; // We assume it has already been initialised

    if (cur_consumer_pool_index >= MAX_NUM_CONSUMERS) {
        COMPONENT_STATE_UPDATE(avionics_component_messaging, state_error);
        return false;
    }
    consumer->impl = &consumer_pool[cur_consumer_pool_index];
    consumer->impl->parent = consumer;

    // Perform any initialisation

    // Ensure all initialization has been completed before we increment the index
    std::atomic_thread_fence(std::memory_order_release);

    // We don't need the thread safe version
    // As stores are atomic and we only modify within this lock zone
    ++cur_consumer_pool_index; // NB: this must be done after all initialization
    return true;
}


static bool messaging_consumer_enqueue_packet(message_consumer_t* consumer, const std::shared_ptr<TelemetryRef>& ref) {
    consumer->impl->mailbox.enqueue(ref);
    return true;
}

// Send a mesage from the specified producer
// A copy of the data will be made, so you can freely modify/release the data after this call
extern "C" messaging_send_return_codes messaging_producer_send(message_producer_t* producer, uint16_t tag, message_metadata_t flags, const uint8_t* data, uint16_t length) {
    if (producer->impl == NULL) {
        COMPONENT_STATE_UPDATE(avionics_component_messaging, state_error);
        return messaging_send_invalid_producer;
    }
    if ((tag & producer->packet_source_mask) != 0) {
        COMPONENT_STATE_UPDATE(avionics_component_messaging, state_error);
        return messaging_send_invalid_tag;
    }



    telemetry_t* packet = telemetry_allocator_alloc(producer->telemetry_allocator, length);
    if (packet == nullptr) {
        COMPONENT_STATE_UPDATE(avionics_component_messaging, state_error);
        return messaging_send_producer_heap_full;
    }
    auto ref = std::make_shared<TelemetryRef>(packet, flags);
    memcpy(packet->payload, data, length);

    // We have already checked the tag and source don't overlap earlier
    packet->header.id = tag | producer->packet_source;
    packet->header.length = length;
    packet->header.timestamp = platform_get_counter_value();
    packet->header.origin = local_config.origin;

    bool enqueue_successful = true;

    // We create a local copy as it frees up the compiler
    // If a consumer registers during this call it isn't a massive deal that
    // we won't pass it the packet.
    uint32_t num_consumers = cur_consumer_pool_index;
    for (uint32_t i = 0; i < num_consumers; ++i) {
        message_consumer_t* consumer = consumer_pool[i].parent;
        if ((consumer->packet_source_mask & packet->header.id) == consumer->packet_source
            && (consumer->message_metadata_mask & flags) == consumer->message_metadata
            && !messaging_consumer_enqueue_packet(consumer, ref)) {
            enqueue_successful = false;
        }
    }

    return enqueue_successful ? messaging_send_ok : messaging_send_consumer_buffer_full;
}

// Consume the next packet in the consumer's buffer
// If silent is specified will not invoke the callback function
extern "C" messaging_receive_return_codes messaging_consumer_receive(message_consumer_t* consumer, bool blocking, bool silent) {
    if (consumer->impl == nullptr) {
        COMPONENT_STATE_UPDATE(avionics_component_messaging, state_error);
        return messaging_receive_invalid_consumer;
    }

    if (consumer->impl->mailbox.isEmpty() && !blocking)
        return messaging_receive_buffer_empty;

    auto ref = consumer->impl->mailbox.dequeue();
    if (!silent)
        consumer->consumer_func(ref->packet, ref->flags);

    return messaging_receive_ok;
}
