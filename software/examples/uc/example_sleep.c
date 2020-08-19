

#include "bindings/hal_common.h"
#include "bindings/brick_hat.h"

#define UID "XXYYZZ" // Change XXYYZZ to the UID of your HAT Brick

void check(int rc, const char* msg);




TF_HAT hat;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_hat_create(&hat, UID, hal), "create device object");


	// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
	check(tf_hat_set_sleep_mode(&hat, 2, 1800, true, true, true), "call set_sleep_mode");

}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
