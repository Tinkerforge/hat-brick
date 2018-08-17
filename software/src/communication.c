/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
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
#include "bricklib2/protocols/tfp/tfp.h"

#include "voltage.h"
#include "max17260.h"
#include "rtc.h"

#include "xmc_rtc.h"

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_BATTERY_STATISTICS: return get_battery_statistics(message, response);
		case FID_SET_POWER_OFF:          return set_power_off(message);
		case FID_GET_POWER_OFF:          return get_power_off(message, response);
		case FID_SET_TIME:               return set_time(message);
		case FID_GET_TIME:               return get_time(message, response);
		default:                         return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse get_battery_statistics(const GetBatteryStatistics *data, GetBatteryStatistics_Response *response) {
	response->header.length            = sizeof(GetBatteryStatistics_Response);
	response->battery_connected        = max17260.battery_connected;
	response->voltage_usb              = voltage_get_usb_voltage();
	response->voltage_dc               = voltage_get_dc_voltage();

	if(response->battery_connected) {
		response->capacity_full        = max17260.capacity_full;
		response->capacity_nominal     = max17260.capacity_nominal;
		response->capacity_remaining   = max17260.capacity_remaining;
		response->percentage_charge    = max17260.percentage_charge;
		response->time_to_empty        = max17260.time_to_emtpy;
		response->time_to_full         = max17260.time_to_full;
		response->voltage_battery      = max17260.voltage_battery;
		response->current_flow         = max17260.current_flow;
		response->temperature_battery  = max17260.temperature_battery;
	} else {
		response->capacity_full        = 0;
		response->capacity_nominal     = 0;
		response->capacity_remaining   = 0;
		response->percentage_charge    = 0;
		response->time_to_empty        = 0;
		response->time_to_full         = 0;
		response->voltage_battery      = 0;
		response->current_flow         = 0;
		response->temperature_battery  = 0;
	}

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_power_off(const SetPowerOff *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_power_off(const GetPowerOff *data, GetPowerOff_Response *response) {
	response->header.length = sizeof(GetPowerOff_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_time(const SetTime *data) {
	if(data->year    < 2000 || data->year    > 2099 ||
	   data->month   < 1    || data->month   > 12   ||
	   data->day     < 1    || data->day     > 31   ||
	                           data->hour    > 23   ||
	                           data->minute  > 59   ||
	                           data->second  > 59   ||
	   data->weekday < 1    || data->weekday > 7) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	XMC_RTC_TIME_t t = {
		.year       = data->year,
		.month      = data->month,
		.days       = data->day - 1,
		.hours      = data->hour,
		.minutes    = data->minute,
		.seconds    = data->second,
		.daysofweek = data->weekday
	};
	XMC_RTC_SetTime(&t);

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_time(const GetTime *data, GetTime_Response *response) {
	response->header.length = sizeof(GetTime_Response);

	XMC_RTC_TIME_t t;
	XMC_RTC_GetTime(&t);
	response->year    = t.year;
	response->month   = t.month;
	response->day     = t.days + 1;
	response->hour    = t.hours;
	response->minute  = t.minutes;
	response->second  = t.seconds;
	response->weekday = t.daysofweek;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}



void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	communication_callback_init();
}
