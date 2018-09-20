/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define HAT_WEEKDAY_MONDAY 1
#define HAT_WEEKDAY_TUESDAY 2
#define HAT_WEEKDAY_WEDNESDAY 3
#define HAT_WEEKDAY_THURSDAY 4
#define HAT_WEEKDAY_FRIDAY 5
#define HAT_WEEKDAY_SATURDAY 6
#define HAT_WEEKDAY_SUNDAY 7

#define HAT_BOOTLOADER_MODE_BOOTLOADER 0
#define HAT_BOOTLOADER_MODE_FIRMWARE 1
#define HAT_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define HAT_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define HAT_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define HAT_BOOTLOADER_STATUS_OK 0
#define HAT_BOOTLOADER_STATUS_INVALID_MODE 1
#define HAT_BOOTLOADER_STATUS_NO_CHANGE 2
#define HAT_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define HAT_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define HAT_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define HAT_STATUS_LED_CONFIG_OFF 0
#define HAT_STATUS_LED_CONFIG_ON 1
#define HAT_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define HAT_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_GET_BATTERY_STATISTICS 1
#define FID_SET_POWER_OFF 2
#define FID_GET_POWER_OFF 3
#define FID_SET_TIME 4
#define FID_GET_TIME 5
#define FID_SET_BATTERY_PARAMETERS 6
#define FID_GET_BATTERY_PARAMETERS 7


typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetBatteryStatistics;

typedef struct {
	TFPMessageHeader header;
	bool battery_connected;
	int32_t capacity_full;
	int32_t capacity_nominal;
	int32_t capacity_remaining;
	int32_t percentage_charge;
	int32_t time_to_empty;
	int32_t time_to_full;
	int32_t voltage_battery;
	int32_t voltage_usb;
	int32_t voltage_dc;
	int32_t current_flow;
	int32_t temperature_battery;
} __attribute__((__packed__)) GetBatteryStatistics_Response;

typedef struct {
	TFPMessageHeader header;
	uint32_t power_off_delay;
	uint32_t power_off_duration;
	bool raspberry_pi_off;
	bool bricklets_off;
	bool enable_sleep_indicator;
} __attribute__((__packed__)) SetPowerOff;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetPowerOff;

typedef struct {
	TFPMessageHeader header;
	uint32_t power_off_delay;
	uint32_t power_off_duration;
	bool raspberry_pi_off;
	bool bricklets_off;
	bool enable_sleep_indicator;
} __attribute__((__packed__)) GetPowerOff_Response;

typedef struct {
	TFPMessageHeader header;
	uint16_t year;
	uint8_t month;
	uint8_t day;
	uint8_t hour;
	uint8_t minute;
	uint8_t second;
	uint8_t weekday;
} __attribute__((__packed__)) SetTime;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetTime;

typedef struct {
	TFPMessageHeader header;
	uint16_t year;
	uint8_t month;
	uint8_t day;
	uint8_t hour;
	uint8_t minute;
	uint8_t second;
	uint8_t weekday;
} __attribute__((__packed__)) GetTime_Response;

typedef struct {
	TFPMessageHeader header;
	uint16_t nominal_capacity;
	uint16_t charge_termination_current;
	uint16_t empty_voltage;
	uint16_t learned_parameters[5];
} __attribute__((__packed__)) SetBatteryParameters;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetBatteryParameters;

typedef struct {
	TFPMessageHeader header;
	uint16_t nominal_capacity;
	uint16_t charge_termination_current;
	uint16_t empty_voltage;
	uint16_t learned_parameters[5];
} __attribute__((__packed__)) GetBatteryParameters_Response;


// Function prototypes
BootloaderHandleMessageResponse get_battery_statistics(const GetBatteryStatistics *data, GetBatteryStatistics_Response *response);
BootloaderHandleMessageResponse set_power_off(const SetPowerOff *data);
BootloaderHandleMessageResponse get_power_off(const GetPowerOff *data, GetPowerOff_Response *response);
BootloaderHandleMessageResponse set_time(const SetTime *data);
BootloaderHandleMessageResponse get_time(const GetTime *data, GetTime_Response *response);
BootloaderHandleMessageResponse set_battery_parameters(const SetBatteryParameters *data);
BootloaderHandleMessageResponse get_battery_parameters(const GetBatteryParameters *data, GetBatteryParameters_Response *response);

// Callbacks


#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 0
#define COMMUNICATION_CALLBACK_LIST_INIT \


#endif
