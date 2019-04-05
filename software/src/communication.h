/* hat-brick
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
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
#define FID_SET_SLEEP_MODE 1
#define FID_GET_SLEEP_MODE 2
#define FID_SET_BRICKLET_POWER 3
#define FID_GET_BRICKLET_POWER 4
#define FID_GET_VOLTAGES 5


typedef struct {
	TFPMessageHeader header;
	uint32_t power_off_delay;
	uint32_t power_off_duration;
	bool raspberry_pi_off;
	bool bricklets_off;
	bool enable_sleep_indicator;
} __attribute__((__packed__)) SetSleepMode;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetSleepMode;

typedef struct {
	TFPMessageHeader header;
	uint32_t power_off_delay;
	uint32_t power_off_duration;
	bool raspberry_pi_off;
	bool bricklets_off;
	bool enable_sleep_indicator;
} __attribute__((__packed__)) GetSleepMode_Response;

typedef struct {
	TFPMessageHeader header;
	bool bricklet_power;
} __attribute__((__packed__)) SetBrickletPower;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetBrickletPower;

typedef struct {
	TFPMessageHeader header;
	bool bricklet_power;
} __attribute__((__packed__)) GetBrickletPower_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetVoltages;

typedef struct {
	TFPMessageHeader header;
	uint16_t voltage_usb;
	uint16_t voltage_dc;
} __attribute__((__packed__)) GetVoltages_Response;


// Function prototypes
BootloaderHandleMessageResponse set_sleep_mode(const SetSleepMode *data);
BootloaderHandleMessageResponse get_sleep_mode(const GetSleepMode *data, GetSleepMode_Response *response);
BootloaderHandleMessageResponse set_bricklet_power(const SetBrickletPower *data);
BootloaderHandleMessageResponse get_bricklet_power(const GetBrickletPower *data, GetBrickletPower_Response *response);
BootloaderHandleMessageResponse get_voltages(const GetVoltages *data, GetVoltages_Response *response);

// Callbacks


#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 0
#define COMMUNICATION_CALLBACK_LIST_INIT \


#endif
