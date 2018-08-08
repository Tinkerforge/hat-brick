/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_eeprom.c: Config for EEPROM Emulation
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

#ifndef CONFIG_EEPROM
#define CONFIG_EEPROM

#include "xmc_gpio.h"
#include "xmc_i2c.h"

#define EEPROM_I2C_BAUDRATE         400000

#define EEPROM_I2C_ADDRESS          (0x50 << 1)
#define EEPROM_I2C                  XMC_I2C1_CH0

#define EEPROM_SCL_PIN              P0_2
#define EEPROM_SCL_PIN_MODE         XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN_ALT8
#define EEPROM_SCL_INPUT            XMC_USIC_CH_INPUT_DX1
#define EEPROM_SCL_SOURCE           0 //DXA

#define EEPROM_SDA_PIN              P0_3
#define EEPROM_SDA_PIN_MODE         XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN_ALT9
#define EEPROM_SDA_INPUT            XMC_USIC_CH_INPUT_DX0
#define EEPROM_SDA_SOURCE           1 //DXB

#define EEPROM_TX_FIFO_SIZE         XMC_USIC_CH_FIFO_SIZE_16WORDS
#define EEPROM_TX_FIFO_POINTER      16

#define EEPROM_RX_FIFO_SIZE         XMC_USIC_CH_FIFO_SIZE_16WORDS
#define EEPROM_RX_FIFO_POINTER      0

#endif