/* hat-brick
 * Copyright (C) 2018, 2021 Olaf Lüke <olaf@tinkerforge.com>
 *
 * eeprom.c: EEPROM Emulation
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

#include "eeprom.h"

#include "bricklib2/logging/logging.h"
#include "configs/config_eeprom.h"
#include "communication.h"

#include "eeprom_data.h"

#include "xmc_scu.h"

typedef enum XMC_I2C_CH_TDF {
	XMC_I2C_CH_TDF_MASTER_SEND         = 0,
	XMC_I2C_CH_TDF_SLAVE_SEND          = 1 << 8,
	XMC_I2C_CH_TDF_MASTER_RECEIVE_ACK  = 2 << 8,
	XMC_I2C_CH_TDF_MASTER_RECEIVE_NACK = 3 << 8,
	XMC_I2C_CH_TDF_MASTER_START        = 4 << 8,
	XMC_I2C_CH_TDF_MASTER_RESTART      = 5 << 8,
	XMC_I2C_CH_TDF_MASTER_STOP         = 6 << 8
} XMC_I2C_CH_TDF_t;

#define EEPROM_REGISTER_MASK 8191

#define eeprom_tx_handler       IRQ_Hdlr_12
#define eeprom_protocol_handler IRQ_Hdlr_11

// We use DS1307 and change it to PCF8523 if necessary by
// just changes the necessary bytes.
// We don't have enough space to save both EEPROM entries.
#if 0
#define EEPROM_DATA_PCF8523_LENGTH sizeof(eeprom_data_pcf8523)
extern const uint8_t eeprom_data_pcf8523[];
#define EEPROM_DATA_DS1307_LENGTH sizeof(eeprom_data_ds1307)
extern const uint8_t eeprom_data_ds1307[];
#endif

static volatile uint32_t eeprom_register = 0;

static uint8_t eeprom_register_high_byte = 0;
static bool eeprom_register_high_byte_received = false;

EEPROM eeprom;

void eeprom_settings_write(void) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];

	page[CALIBRATION_MAGIC_POS] = CALIBRATION_MAGIC;
	page[CALIBRATION_RTC_POS]   = eeprom.rtc_driver;

	if(!bootloader_write_eeprom_page(CALIBRATION_PAGE, page)) {
		// TODO: Error handling?
		return;
	}
}

void eeprom_settings_read(void) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];

	bootloader_read_eeprom_page(CALIBRATION_PAGE, page);

	// The magic number is not where it is supposed to be.
	// This is either our first startup or something went wrong.
	// We initialize the calibration data with sane default values.
	if(page[CALIBRATION_MAGIC_POS] != CALIBRATION_MAGIC) {
		eeprom.rtc_driver = HAT_RTC_DRIVER_PCF8523; // PCF8523 is default

		return;
	}

	eeprom.rtc_driver = page[CALIBRATION_RTC_POS];
}

void eeprom_init(void) {
	memset(&eeprom, 0, sizeof(EEPROM));

	eeprom_settings_read();

	if(eeprom.rtc_driver == HAT_RTC_DRIVER_PCF8523) {
		EEPROM_PATCH_TO_PCF8523();
	}

	XMC_I2C_CH_Stop(EEPROM_I2C);
	const XMC_GPIO_CONFIG_t input_config =  {
		.mode         = XMC_GPIO_MODE_INPUT_TRISTATE,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH,
	};

	XMC_GPIO_Init(EEPROM_SCL_PIN, &input_config);
	XMC_GPIO_Init(EEPROM_SDA_PIN, &input_config);

	const XMC_I2C_CH_CONFIG_t i2c_slave_config = {
		.baudrate = EEPROM_I2C_BAUDRATE,
		.address  = EEPROM_I2C_ADDRESS
	};

	const XMC_GPIO_CONFIG_t scl_pin_config = {
		.mode         = EEPROM_SCL_PIN_MODE,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH,
	};

	const XMC_GPIO_CONFIG_t sda_pin_config = {
		.mode         = EEPROM_SDA_PIN_MODE,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH,
    };

	XMC_I2C_CH_Init(EEPROM_I2C, &i2c_slave_config);

	XMC_I2C_CH_SetInputSource(EEPROM_I2C, EEPROM_SDA_INPUT, EEPROM_SDA_SOURCE);
	XMC_I2C_CH_SetInputSource(EEPROM_I2C, EEPROM_SCL_INPUT, EEPROM_SCL_SOURCE);

	XMC_USIC_CH_TXFIFO_Configure(EEPROM_I2C, EEPROM_TX_FIFO_POINTER, EEPROM_TX_FIFO_SIZE, 8);
	XMC_USIC_CH_TXFIFO_SetInterruptNodePointer(EEPROM_I2C, XMC_USIC_CH_TXFIFO_INTERRUPT_NODE_POINTER_STANDARD, 3);

	XMC_USIC_CH_RXFIFO_Configure(EEPROM_I2C, EEPROM_RX_FIFO_POINTER, EEPROM_RX_FIFO_SIZE, 8);

	XMC_USIC_CH_SetInterruptNodePointer(EEPROM_I2C, XMC_USIC_CH_INTERRUPT_NODE_POINTER_PROTOCOL, 2);
	XMC_I2C_CH_Start(EEPROM_I2C);

	XMC_GPIO_Init(EEPROM_SCL_PIN, &scl_pin_config);
	XMC_GPIO_Init(EEPROM_SDA_PIN, &sda_pin_config);

	NVIC_SetPriority(12, 1); // tx
	NVIC_EnableIRQ(12);
	NVIC_SetPriority(11, 0); // protocol
	NVIC_EnableIRQ(11);
	XMC_I2C_CH_EnableEvent(EEPROM_I2C, XMC_I2C_CH_EVENT_SLAVE_READ_REQUEST | XMC_I2C_CH_EVENT_ERROR);
}


void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) eeprom_tx_handler(void) {
	// Fill fifo (if the read transfer stops we flush the fifo again)
	while(!XMC_USIC_CH_TXFIFO_IsFull(EEPROM_I2C)) {
		EEPROM_I2C->IN[0] = XMC_I2C_CH_TDF_SLAVE_SEND | eeprom_data[eeprom_register];
		eeprom_register = (eeprom_register + 1) & EEPROM_REGISTER_MASK;
	}
}

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) eeprom_protocol_handler(void) {
    uint32_t status = XMC_I2C_CH_GetStatusFlag(EEPROM_I2C);

	// In case of stop condition or error we reset the tx fifo and i2c state machine
	if(status & (XMC_I2C_CH_STATUS_FLAG_ERROR | XMC_I2C_CH_STATUS_FLAG_STOP_CONDITION_RECEIVED)) {
		XMC_USIC_CH_TXFIFO_DisableEvent(EEPROM_I2C, XMC_USIC_CH_TXFIFO_EVENT_CONF_STANDARD);
		XMC_USIC_CH_TXFIFO_ClearEvent(EEPROM_I2C, XMC_USIC_CH_TXFIFO_EVENT_CONF_STANDARD);
		XMC_USIC_CH_TXFIFO_Flush(EEPROM_I2C);
		XMC_USIC_CH_SetTransmitBufferStatus(EEPROM_I2C, 0b10); // Clear bits TDV and TE

		// In case of error we re-initialize the whole thing.
		if(status & XMC_I2C_CH_STATUS_FLAG_ERROR) {
			eeprom_init();
		}

		XMC_I2C_CH_ClearStatusFlag(XMC_I2C0_CH1, XMC_I2C_CH_STATUS_FLAG_ERROR | XMC_I2C_CH_STATUS_FLAG_STOP_CONDITION_RECEIVED);
	}

	if(status & XMC_I2C_CH_STATUS_FLAG_SLAVE_READ_REQUESTED) {
		while(!XMC_USIC_CH_RXFIFO_IsEmpty(EEPROM_I2C)) {
			// In case of a read request we set the register variable to the
			// desired register.
            if(!eeprom_register_high_byte_received) {
                eeprom_register_high_byte = XMC_I2C_CH_GetReceivedData(EEPROM_I2C);
                eeprom_register_high_byte_received = true;
            } else {
			    eeprom_register = ((eeprom_register_high_byte << 8) | XMC_I2C_CH_GetReceivedData(EEPROM_I2C)) & EEPROM_REGISTER_MASK;
                eeprom_register_high_byte_received = false;
                eeprom_register_high_byte = 0;

                // Fill buffer with data starting from address.
				XMC_USIC_CH_TXFIFO_Flush(EEPROM_I2C);
                eeprom_tx_handler();
                XMC_USIC_CH_TXFIFO_ClearEvent(EEPROM_I2C, XMC_USIC_CH_TXFIFO_EVENT_CONF_STANDARD);
                XMC_USIC_CH_TXFIFO_EnableEvent(EEPROM_I2C, XMC_USIC_CH_TXFIFO_EVENT_CONF_STANDARD);
            }

		}

		XMC_I2C_CH_ClearStatusFlag(EEPROM_I2C, XMC_I2C_CH_STATUS_FLAG_SLAVE_READ_REQUESTED);
	}

	// If we receive bytes after the register number we read the data
	// and throw it away (we don't have any writable registers).
	if(status & XMC_I2C_CH_STATUS_FLAG_RECEIVE_INDICATION) {
		while(!XMC_USIC_CH_RXFIFO_IsEmpty(EEPROM_I2C)) {
			uint32_t __attribute__((unused)) _ = XMC_I2C_CH_GetReceivedData(EEPROM_I2C);
		}

		XMC_I2C_CH_ClearStatusFlag(EEPROM_I2C, XMC_I2C_CH_STATUS_FLAG_RECEIVE_INDICATION);
	}
}
