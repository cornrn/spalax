#ifndef MESSAGING_H
#define MESSAGING_H
#include "telemetry.h"
#include <stdbool.h>
#include "telemetry_allocator.h"
#include "messaging_defs.h"

void init_messaging(void);

// Initialise a producer - returns false on error
bool messaging_producer_init(message_producer_t* producer);

// Initialise a consumer - returns false on error
bool messaging_consumer_init(message_consumer_t* consumer);

// Send a mesage from the specified producer
// A copy of the data will be made, so you can freely modify/release the data after this call
messaging_send_return_codes messaging_producer_send(message_producer_t* producer, uint16_t tag, const uint8_t* data, uint16_t length);

// Consume the next packet in the consumer's buffer
// If silent is specified will not invoke the callback function
messaging_receive_return_codes messaging_consumer_receive(message_consumer_t* consumer_id, bool blocking, bool silent);

#endif /* MESSAGING_H */
