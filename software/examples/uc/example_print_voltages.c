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

	// Get current get voltages
	uint16_t voltage_usb, voltage_dc;
	check(tf_hat_get_voltages(&hat, &voltage_usb, &voltage_dc), "get get voltages");

	tf_hal_printf("Voltage USB: %d 1/%d V\n", voltage_usb, 1000);
	tf_hal_printf("Voltage DC: %d 1/%d V\n", voltage_dc, 1000);
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
