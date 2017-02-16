#include <gmock/gmock.h>
#include "Eigen/Core"
#include "state/kalman.h"
#include "math_debug_util.h"
#include <random>

#define NUM_TESTS 5000

using namespace Eigen;

static fp accel_reference[3] = {0, 0, 1};
static fp magno_reference[3] = {1, 0, 0};

inline void setup(Quaternion<fp>& quat, const Vector3f& angular_velocity) {
    fp quat_arr[4] = {quat.x(), quat.y(), quat.z(), quat.w()};
    fp ang_vel[3] = {angular_velocity.x(), angular_velocity.y(), angular_velocity.z()};

    kalman_init(accel_reference, magno_reference, quat_arr, ang_vel);
}

inline void testEstimateStable(const state_estimate_t &estimate) {
    for (int i = 0; i < 4; i++)
        EXPECT_FALSE(isnan(estimate.orientation_q[i]));

    EXPECT_FALSE(isnan(estimate.altitude));
    EXPECT_FALSE(isnan(estimate.latitude));
    EXPECT_FALSE(isnan(estimate.longitude));

    for (int i = 0; i < 4; i++) {
        EXPECT_FALSE(isnan(estimate.angular_velocity[i]));
    }
}

inline fp clampf(fp v, fp min, fp max) {
    if (v < min) v = min;
    if (v > max) v = max;
    return v;
}

void gyro_test(const Vector3f& angle_increment) {

    state_estimate_t estimate;

    Matrix<fp, 3, 1> unrotated_magno = Matrix<fp, 3, 1>(1, 0, 0);
    Matrix<fp, 3, 1> unrotated_accel = Matrix<fp, 3, 1>(0, 0, 1);

    std::default_random_engine generator(3452456);

    // TODO: get this from kalman
    std::normal_distribution<fp> distribution (0.0, 0.00001f);
    std::normal_distribution<fp> gyro_distribution(0, 0.00001f);

    Quaternion<fp> quat = Quaternion<fp>(1,0,0,0);

    const float time_increment = 1000;

    setup(quat, time_increment * angle_increment);

    Quaternion<fp> delta(AngleAxis<fp>(angle_increment.z(), Matrix<fp, 3, 1>::UnitZ()) * AngleAxis<fp>(angle_increment.y(), Matrix<fp, 3, 1>::UnitY()) * AngleAxis<fp>(angle_increment.x(), Matrix<fp, 3, 1>::UnitX()));


    for (int i = 0; i < NUM_TESTS; i++) {
        Quaternion<fp> t = quat * delta;
        quat = t;

        Matrix<fp, 3, 1> rotated_magno = quat * unrotated_magno;
        Matrix<fp, 3, 1> rotated_accel = quat * unrotated_accel;

        fp magno[3] = {rotated_magno.x() + distribution(generator), rotated_magno.y()  + distribution(generator), rotated_magno.z() + distribution(generator)};
        fp accel[3] = {rotated_accel.x() + distribution(generator), rotated_accel.y()  + distribution(generator), rotated_accel.z() + distribution(generator)};
        fp gyro[3] = {angle_increment.x() * time_increment + gyro_distribution(generator), angle_increment.y() * time_increment  + gyro_distribution(generator), angle_increment.z() * time_increment  + gyro_distribution(generator)};

        kalman_predict(1.0f / time_increment);

        kalman_new_magno(magno);
        kalman_new_accel(accel);
        kalman_new_gyro(gyro);

        kalman_get_state(&estimate);
        testEstimateStable(estimate);


    }

    kalman_get_state(&estimate);
    testEstimateStable(estimate);

    fp P[KALMAN_NUM_STATES];
    kalman_get_covariance(P);

    // We expect the attitude error covariance to be close to zero
    EXPECT_LT(P[KALMAN_ATTITUDE_ERR_IDX + 0], 1e-3f);
    EXPECT_LT(P[KALMAN_ATTITUDE_ERR_IDX + 1], 1e-3f);
    EXPECT_LT(P[KALMAN_ATTITUDE_ERR_IDX + 2], 1e-3f);

    Quaternion<fp> out(estimate.orientation_q[3], estimate.orientation_q[0], estimate.orientation_q[1],
                       estimate.orientation_q[2]);

    Matrix<fp, 3, 1> magno_test = out * unrotated_magno;
    Matrix<fp, 3, 1> accel_test = out * unrotated_accel;

    Matrix<fp, 3, 1> rotated_magno = quat * unrotated_magno;
    Matrix<fp, 3, 1> rotated_accel = quat * unrotated_accel;

    // Clampf is necessary due to occasional rounding errors leading to results slight out of the range (-1, 1)
    fp angle = acos(clampf(magno_test.normalized().transpose() * rotated_magno.normalized(), -1, 1)) * 180.0f / (fp)M_PI;
    fp angle2 = acos(clampf(accel_test.normalized().transpose() * rotated_accel.normalized(), -1, 1)) * 180.0f / (fp)M_PI;

    // We expect accuracy to a degree - any less is unreasonable with 32-bit floating point
    EXPECT_LT(angle, 1.0f);
    EXPECT_LT(angle2, 1.0f);

    expect_fuzzy_eq(estimate.angular_velocity[0], angle_increment[0] * time_increment, 0.00005f, 1e-4f);
    expect_fuzzy_eq(estimate.angular_velocity[1], angle_increment[1] * time_increment, 0.00005f, 1e-4f);
    expect_fuzzy_eq(estimate.angular_velocity[2], angle_increment[2] * time_increment, 0.00005f, 1e-4f);
}

TEST(TestKalmanDynamic, TestGyro) {
    // 1 rad/s
    gyro_test(Vector3f(1.0f / 1000, 0, 0));

    // 5 rad/s
    gyro_test(Vector3f(5.0f / 1000, 0, 0));
}