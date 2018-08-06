/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * rpi.c: Driver for Raspberry PI eeprom simulation and IO
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

#include "rpi.h"

#include "configs/config_rpi.h"

#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/utility/led_flicker.h"

typedef enum XMC_I2C_CH_TDF {
	XMC_I2C_CH_TDF_MASTER_SEND         = 0,
	XMC_I2C_CH_TDF_SLAVE_SEND          = 1 << 8,
	XMC_I2C_CH_TDF_MASTER_RECEIVE_ACK  = 2 << 8,
	XMC_I2C_CH_TDF_MASTER_RECEIVE_NACK = 3 << 8,
	XMC_I2C_CH_TDF_MASTER_START        = 4 << 8,
	XMC_I2C_CH_TDF_MASTER_RESTART      = 5 << 8,
	XMC_I2C_CH_TDF_MASTER_STOP         = 6 << 8
} XMC_I2C_CH_TDF_t;

#define i2c_slave_tx_handler  IRQ_Hdlr_12 
#define i2c_slave_protocol_handler IRQ_Hdlr_11 

RPI rpi;

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) i2c_slave_tx_handler(void) {
}

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) i2c_slave_protocol_handler(void) {
}

void rpi_init_i2c(void) {
	XMC_I2C_CH_Stop(RPI_I2C);
	const XMC_GPIO_CONFIG_t input_config =  {
		.mode         = XMC_GPIO_MODE_INPUT_TRISTATE,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH,
	};

	XMC_GPIO_Init(RPI_SCL_PIN, &input_config);
	XMC_GPIO_Init(RPI_SDA_PIN, &input_config);


	const XMC_I2C_CH_CONFIG_t i2c_slave_config = {
		.baudrate = RPI_I2C_BAUDRATE,
		.address  = RPI_I2C_ADDRESS
	};

	const XMC_GPIO_CONFIG_t scl_pin_config = { 
		.mode = RPI_SCL_PIN_MODE,
		.output_level   = XMC_GPIO_OUTPUT_LEVEL_HIGH,
	}; 

	const XMC_GPIO_CONFIG_t sda_pin_config = { 
		.mode = RPI_SDA_PIN_MODE,
		.output_level   = XMC_GPIO_OUTPUT_LEVEL_HIGH,
    };

	XMC_I2C_CH_Init(RPI_I2C, &i2c_slave_config);

	XMC_I2C_CH_SetInputSource(RPI_I2C, XMC_I2C_CH_INPUT_SDA, RPI_SDA_INPUT);
	XMC_I2C_CH_SetInputSource(RPI_I2C, XMC_I2C_CH_INPUT_SCL, RPI_SCL_INPUT);

	XMC_USIC_CH_TXFIFO_Configure(RPI_I2C, RPI_TX_FIFO_POINTER, RPI_TX_FIFO_SIZE, 8);
	XMC_USIC_CH_TXFIFO_SetInterruptNodePointer(RPI_I2C, XMC_USIC_CH_TXFIFO_INTERRUPT_NODE_POINTER_STANDARD, 3);

	XMC_USIC_CH_RXFIFO_Configure(RPI_I2C, RPI_RX_FIFO_POINTER, RPI_RX_FIFO_SIZE, 8);

	XMC_USIC_CH_SetInterruptNodePointer(RPI_I2C, XMC_USIC_CH_INTERRUPT_NODE_POINTER_PROTOCOL, 2);
	XMC_I2C_CH_Start(RPI_I2C);

	XMC_GPIO_Init(RPI_SCL_PIN, &scl_pin_config);
	XMC_GPIO_Init(RPI_SDA_PIN, &sda_pin_config);

	NVIC_SetPriority(12, 1); // tx
	NVIC_EnableIRQ(12);
	NVIC_SetPriority(11, 0); // protocol
	NVIC_EnableIRQ(11);
	XMC_I2C_CH_EnableEvent(RPI_I2C, XMC_I2C_CH_EVENT_SLAVE_READ_REQUEST | XMC_I2C_CH_EVENT_ERROR);
}

void rpi_init(void) {
    memset(&rpi, 0, sizeof(RPI));
    XMC_GPIO_CONFIG_t output_high = {
	    .mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
        .output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
    };

    XMC_GPIO_CONFIG_t output_low = {
	    .mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
        .output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
    };

	XMC_GPIO_Init(RPI_BOOST_EN_PIN, &output_high);
	XMC_GPIO_Init(RPI_BRICKLET_EN_PIN, &output_high);
	XMC_GPIO_Init(RPI_RPI_EN_PIN, &output_high);

	XMC_GPIO_Init(RPI_LED_LOW_PIN, &output_low);
	XMC_GPIO_Init(RPI_LED_MID_PIN, &output_low);
	XMC_GPIO_Init(RPI_LED_HIGH_PIN, &output_low);
    rpi.leds[0].config = LED_FLICKER_CONFIG_EXTERNAL;
    rpi.leds[1].config = LED_FLICKER_CONFIG_EXTERNAL;
    rpi.leds[2].config = LED_FLICKER_CONFIG_EXTERNAL;

    rpi_init_i2c();
}

void rpi_tick(void) {
    for(uint8_t i = 0; i < RPI_NUM_LEDS; i++) {
        if(rpi.leds[i].config == LED_FLICKER_CONFIG_EXTERNAL) {
            // TODO
        } else {
            LEDFlickerState *state = &rpi.leds[i];
            uint32_t ms = system_timer_get_ms();
            switch(i) {
                case RPI_LED_LOW:  led_flicker_tick(state, ms, RPI_LED_LOW_PIN);  break;
                case RPI_LED_MID:  led_flicker_tick(state, ms, RPI_LED_MID_PIN);  break;
                case RPI_LED_HIGH: led_flicker_tick(state, ms, RPI_LED_HIGH_PIN); break;
                default:           loge("RPI: Unexpected LED: %d\n\r", i);        break;
            }
        }
    }
}