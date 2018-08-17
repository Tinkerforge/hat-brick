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

#include "eeprom.h"
#include "max17260.h"
#include "voltage.h"

#include "configs/config_rpi.h"

#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/utility/led_flicker.h"

#include "xmc_wdt.h"
#include "xmc_rtc.h"

#define RPI_LED_POWER_LOW_FLICKER_TIME 5000
#define rpi_sleep_rtc_interrupt IRQ1_Handler
RPI rpi;

volatile int32_t rpi_sleep_seconds_counter = 0;
volatile bool rpi_sleep_enable_indicator = false;

const uint8_t rpi_led_pins[RPI_NUM_LEDS] = {RPI_LED_LOW_PIN, RPI_LED_MID_PIN, RPI_LED_HIGH_PIN};
XMC_GPIO_PORT_t *rpi_led_ports[RPI_NUM_LEDS] = {RPI_LED_LOW_PORT, RPI_LED_MID_PORT, RPI_LED_HIGH_PORT};

void rpi_init(void) {
	logd("RPi init\n\r");
	memset(&rpi, 0, sizeof(RPI));
	XMC_GPIO_CONFIG_t output_high = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
	};

	XMC_GPIO_CONFIG_t output_low = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
	};

	XMC_GPIO_Init(RPI_BOOST_EN_PIN,    &output_high);
	XMC_GPIO_Init(RPI_BRICKLET_EN_PIN, &output_high);
	XMC_GPIO_Init(RPI_RPI_EN_PIN,      &output_high);

	for(uint8_t i = 0; i < RPI_NUM_LEDS; i++) {
		XMC_GPIO_Init(rpi_led_ports[i], rpi_led_pins[i],  &output_low);
		rpi.leds[i].config = LED_FLICKER_CONFIG_EXTERNAL;
	}

	// Configure RTC interrupt
	NVIC_SetPriority(RPI_SLEEP_RTC_IRQ, 3);
	XMC_SCU_SetInterruptControl(RPI_SLEEP_RTC_IRQ, XMC_SCU_IRQCTRL_SCU_SR1_IRQ1);
}

void rpi_handle_battery_leds(void) {
	uint8_t led[3];
	switch(max17260.percentage_charge/1600) {
		default:
		case 6:
		case 5: led[2] = 1; led[1] = 1; led[0] = 1; break;
		case 4: led[2] = 2; led[1] = 1; led[0] = 1; break;
		case 3: led[2] = 0; led[1] = 1; led[0] = 1; break;
		case 2: led[2] = 0; led[1] = 2; led[0] = 1; break;
		case 1: led[2] = 0; led[1] = 0; led[0] = 1; break;
		case 0: led[2] = 0; led[1] = 0; led[0] = 2; break;
	}

	for(uint8_t i = 0; i < RPI_NUM_LEDS; i++) {
		if(rpi.leds[i].config == LED_FLICKER_CONFIG_EXTERNAL) {
			switch(led[i]) {
				case 0: XMC_GPIO_SetOutputHigh(rpi_led_ports[i], rpi_led_pins[i]); break;
				case 1: XMC_GPIO_SetOutputLow(rpi_led_ports[i], rpi_led_pins[i]); break;
				case 2: 
				default: {
					if(system_timer_is_time_elapsed_ms(rpi.last_flicker_time, RPI_LED_POWER_LOW_FLICKER_TIME)) {
						rpi.last_flicker_time = system_timer_get_ms();
						XMC_GPIO_ToggleOutput(rpi_led_ports[i], rpi_led_pins[i]);
					}
					break;
				}
			}
		} else {
			LEDFlickerState *state = &rpi.leds[i];
			uint32_t ms = system_timer_get_ms();
			led_flicker_tick(state, ms, rpi_led_ports[i], rpi_led_pins[i]);
		}
	}
}

void rpi_sleep_leave(void) {
	// Invalidate the power off duration
	rpi.power_off_duration = 0;
	rpi.power_off_duration_start = 0;

	// Increase clock frequency to full speed again
	XMC_SCU_CLOCK_ScaleMCLKFrequency(1, 0);

	// Turn 1-second RTC interrupt off
	XMC_RTC_DisableEvent(XMC_RTC_EVENT_PERIODIC_SECONDS);
	NVIC_DisableIRQ(RPI_SLEEP_RTC_IRQ);

	// Enable Bricklets, RPi and boost converter again
	XMC_GPIO_SetOutputHigh(RPI_BRICKLET_EN_PIN);
	XMC_GPIO_SetOutputHigh(RPI_RPI_EN_PIN);
	XMC_GPIO_SetOutputHigh(RPI_BOOST_EN_PIN);

	// Restore LED state from before sleep
	for(uint8_t i = 0; i < RPI_NUM_LEDS; i++) {
		if(rpi.led_state_before_turned_off[i]) {
			XMC_GPIO_SetOutputLow(rpi_led_ports[i], rpi_led_pins[i]);
		} else {
			XMC_GPIO_SetOutputHigh(rpi_led_ports[i], rpi_led_pins[i]);
		}
	}
	if(rpi.led_state_before_turned_off[3]) {
		XMC_GPIO_SetOutputLow(BOOTLOADER_STATUS_LED_PIN);
	} else {
		XMC_GPIO_SetOutputHigh(BOOTLOADER_STATUS_LED_PIN);
	}

	// Restore IRQ state from before sleep
	for(uint8_t i = 0; i < 32; i++) {
		if(rpi.irq_state_before_turned_off[i]) {
			NVIC_EnableIRQ(i);
		}
	}

	// Enable SysTick again
	SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk;

	// Enable watchdog timer again
	XMC_WDT_Start();
}

void rpi_sleep_enter(void) {
	// Put sleep indicator flag in global variable, so we don't need to access the struct
	// in the sleep interrupt.
	rpi_sleep_enable_indicator = rpi.enable_sleep_indicator;

	// Turn all LEDs off and save current state
	for(uint8_t i = 0; i < RPI_NUM_LEDS; i++) {
		rpi.led_state_before_turned_off[i] = XMC_GPIO_GetInput(rpi_led_ports[i], rpi_led_pins[i]);
		XMC_GPIO_SetOutputHigh(rpi_led_ports[i], rpi_led_pins[i]);
	}

	// Turn all IRQs off and save current state
	for(uint8_t i = 0; i < 32; i++) {
		rpi.irq_state_before_turned_off[i] = NVIC_GetEnableIRQ(i);
		if(rpi.irq_state_before_turned_off[i]) {
			NVIC_DisableIRQ(i);
		}
	}
	rpi.led_state_before_turned_off[3] = XMC_GPIO_GetInput(BOOTLOADER_STATUS_LED_PIN);
	XMC_GPIO_SetOutputHigh(BOOTLOADER_STATUS_LED_PIN);

	// Turn SysTick off
	SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

	// Turn WDT off
	XMC_WDT_Stop();

	// Enable 1-second timer of RTC
	NVIC_EnableIRQ(RPI_SLEEP_RTC_IRQ);
	XMC_RTC_EnableEvent(XMC_RTC_EVENT_PERIODIC_SECONDS);

	// Turn MCLK down to lowest possible frequency
	XMC_SCU_CLOCK_ScaleMCLKFrequency(255, 0);

	// Use internal RTC
	// TODO: Remove me? vvvvvvvvvv
	SCU_GENERAL->PASSWD = 0xC0;
	while(((SCU_GENERAL->PASSWD)&SCU_GENERAL_PASSWD_PROTS_Msk));
	SCU_CLK->CLKCR = 0x3ff0FFFF; 
	while((SCU_CLK->CLKCR) & 0xC0000000);
	SCU_GENERAL->PASSWD = 0xC3;
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^
}

// This is called once per second by RTC when in deep sleep mode. The amount of
// current that is drawn by the wakeup with a 1-second interval is negligible.
void __attribute__ ((section (".ram_code"))) rpi_sleep_rtc_interrupt(void) {
	// Toggle LED if configured by user
	if(rpi_sleep_enable_indicator) {
		XMC_GPIO_PORT4->OMR = 0x10001U << 4;
	}
	rpi_sleep_seconds_counter--;
}

void __attribute__ ((section (".ram_code"))) rpi_sleep_for_duration(void) {
	// First we set the counter to the amount of seconds we want to sleep
	// We increase the value that the user set by one, since we don't exactly now
	// how long the first RTC second is. We rather sleep a bit too long then
	// too short.
	rpi_sleep_seconds_counter = 1 + (rpi.power_off_duration / 1000);

	// Then we enter sleep mode (all hardware units are turned off, decrease frequency to 125kHz, etc)
	rpi_sleep_enter();

	// Use deep sleep mode.
	PPB->SCR |= PPB_SCR_SLEEPDEEP_Msk;

	// Then we disable the flash. From here on everything needs to run in an interrupt, 
	// including all of the IRQs that are called!
	// Otherwise the MCU will hang forever.
	NVM->NVMCONF &= ~NVM_NVMCONF_NVM_ON_Msk;
	while(NVM->NVMSTATUS & NVM_NVMSTATUS_BUSY_Msk) { __NOP(); }

	// Use ARM wfi command to actually enter sleep state.
	// We keep going into sleep state until the seconds counter reaches zero.
	// The seconds counter is decremented once per second by the RTC (see above).
	while(rpi_sleep_seconds_counter > 0) { __WFI(); }

	// Turn flash on again
	NVM->NVMCONF |= NVM_NVMCONF_NVM_ON_Msk;
	while(NVM->NVMSTATUS & NVM_NVMSTATUS_BUSY_Msk) { __NOP(); }

	// Leave sleep mode (turn all of the hardware units on again, increase frequency to full speed again, etc)
	rpi_sleep_leave();
}

void rpi_handle_power_off(void) {
	if(rpi.power_off_delay_start != 0) {
		if(system_timer_is_time_elapsed_ms(rpi.power_off_delay_start, rpi.power_off_delay)) {
			rpi.power_off_delay = 0;
			rpi.power_off_delay_start = 0;
			if(rpi.power_off_duration != 0) {
				if(rpi.bricklets_off) {
					XMC_GPIO_SetOutputLow(RPI_BRICKLET_EN_PIN);
				}
				if(rpi.raspberry_pi_off) {
					XMC_GPIO_SetOutputLow(RPI_RPI_EN_PIN);
				}
				XMC_GPIO_SetOutputLow(RPI_BOOST_EN_PIN);
				rpi.power_off_duration_start = system_timer_get_ms();
				rpi_sleep_for_duration();
			}
		}
	} 
}

void rpi_tick(void) {
	rpi_handle_battery_leds();
	rpi_handle_power_off();
}