/* hat-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/utility/util_definitions.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/protocols/tfp/tfp.h"

#include "configs/config_rpi.h"
#include "rpi.h"
#include "voltage.h"
#include "xmc_gpio.h"

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_SET_SLEEP_MODE: return set_sleep_mode(message);
		case FID_GET_SLEEP_MODE: return get_sleep_mode(message, response);
		case FID_SET_BRICKLET_POWER: return set_bricklet_power(message);
		case FID_GET_BRICKLET_POWER: return get_bricklet_power(message, response);
		case FID_GET_VOLTAGES: return get_voltages(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_sleep_mode(const SetSleepMode *data) {
	rpi.power_off_delay_start  = system_timer_get_ms();
	rpi.power_off_delay        = data->power_off_delay*1000;
	rpi.power_off_duration     = data->power_off_duration*1000;
	rpi.raspberry_pi_off       = data->raspberry_pi_off;
	rpi.bricklets_off          = data->bricklets_off;
	rpi.enable_sleep_indicator = data->enable_sleep_indicator;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_sleep_mode(const GetSleepMode *data, GetSleepMode_Response *response) {
	response->header.length = sizeof(GetSleepMode_Response);
	response->raspberry_pi_off       = rpi.raspberry_pi_off;
	response->bricklets_off          = rpi.bricklets_off;
	response->enable_sleep_indicator = rpi.enable_sleep_indicator;

	if(rpi.power_off_delay_start == 0) {
		response->power_off_delay = 0;
		if(rpi.power_off_duration_start == 0) {
			response->power_off_duration = 0;
		} else {
			response->power_off_duration = MAX(rpi.power_off_duration - (system_timer_get_ms() - rpi.power_off_duration_start), 0)/1000;
		}
	} else {
		response->power_off_duration = rpi.power_off_duration/1000;
		response->power_off_delay    = MAX(rpi.power_off_delay - (system_timer_get_ms() - rpi.power_off_delay_start), 0)/1000;
	}

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_bricklet_power(const SetBrickletPower *data) {
	rpi.bricklet_power = data->bricklet_power;

	if(rpi.bricklet_power) {
		XMC_GPIO_SetOutputHigh(RPI_BRICKLET_EN_PIN);
	} else {
		XMC_GPIO_SetOutputLow(RPI_BRICKLET_EN_PIN);
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_bricklet_power(const GetBrickletPower *data, GetBrickletPower_Response *response) {
	response->header.length  = sizeof(GetBrickletPower_Response);
	response->bricklet_power = rpi.bricklet_power;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse get_voltages(const GetVoltages *data, GetVoltages_Response *response) {
	response->header.length = sizeof(GetVoltages_Response);
	response->voltage_dc    = voltage.voltage_dc;
	response->voltage_usb   = voltage.voltage_usb;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

#if 0

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	communication_callback_init();
}

#endif