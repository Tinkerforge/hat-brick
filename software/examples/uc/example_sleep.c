// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/brick_hat.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_HAT hat;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_hat_create(&hat, NULL, hal), "create device object");

	// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
	check(tf_hat_set_sleep_mode(&hat, 2, 1800, true, true, true), "call set_sleep_mode");
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
