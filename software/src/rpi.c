/* hat-brick
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
#include "voltage.h"

#include "configs/config_rpi.h"
#include "configs/config_custom_bootloader.h"

#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/utility/led_flicker.h"

#include "xmc_wdt.h"
#include "xmc_rtc.h"
#include "xmc_scu.h"

#define RTC_DIVIDERVALUE 0x7FFF

#define rpi_sleep_rtc_interrupt SCU_1_IRQHandler
RPI rpi;

volatile int32_t rpi_sleep_seconds_counter = 0;
volatile bool rpi_sleep_enable_indicator = false;


// This is called once per second by RTC when in deep sleep mode. The amount of
// current that is drawn by the wakeup with a 1-second interval is negligible.
void __attribute__ ((section (".ram_code"))) rpi_sleep_rtc_interrupt(void) {
	// Toggle LED if configured by user
	if(rpi_sleep_enable_indicator) {
		XMC_GPIO_PORT1->OMR = 0x10001U << 1;
	}
	rpi_sleep_seconds_counter--;
}

void rpi_init(void) {
	memset(&rpi, 0, sizeof(RPI));
	XMC_GPIO_CONFIG_t output_high = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
	};

	XMC_GPIO_Init(RPI_BRICKLET_EN_PIN, &output_high);
	XMC_GPIO_Init(RPI_RPI_EN_PIN,      &output_high);

	rpi.bricklet_power = true;

	const XMC_RTC_CONFIG_t config = {
		{
			.seconds = 0,
  			.minutes = 0,
  			.hours = 0,
  			.days = 0,
  			.daysofweek = XMC_RTC_WEEKDAY_THURSDAY,
			.month = XMC_RTC_MONTH_JANUARY,
  			.year = 1970
		}, {
  			.seconds = 0,
  			.minutes = 0,
  			.hours = 0,
  			.days = 0,
  			.month = XMC_RTC_MONTH_JANUARY,
  			.year = 1970
		},
		.prescaler = RTC_DIVIDERVALUE
	};

	XMC_RTC_Init(&config);
	XMC_RTC_Start();

	// Configure RTC interrupt
	NVIC_EnableIRQ(RPI_SLEEP_RTC_IRQ);
	NVIC_SetPriority(RPI_SLEEP_RTC_IRQ, 3);
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

	// Enable Bricklets and RPi again
	if(rpi.bricklet_power) {
		XMC_GPIO_SetOutputHigh(RPI_BRICKLET_EN_PIN);
	}
	XMC_GPIO_SetOutputHigh(RPI_RPI_EN_PIN);

	if(rpi.led_state_before_turned_off) {
		XMC_GPIO_SetOutputLow(BOOTLOADER_STATUS_LED_PIN);
	} else {
		XMC_GPIO_SetOutputHigh(BOOTLOADER_STATUS_LED_PIN);
	}

	// Restore IRQ state from before sleep
	for(uint8_t i = 0; i < 32; i++) {
		if(rpi.irq_state_before_turned_off & (1 << i)) {
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

	// Turn all IRQs off and save current state
	rpi.irq_state_before_turned_off = 0;
	for(uint8_t i = 0; i < 32; i++) {
		const bool enabled = NVIC_GetEnableIRQ(i);
		rpi.irq_state_before_turned_off |= enabled << i;
		if(enabled) {
			NVIC_DisableIRQ(i);
		}
	}
	rpi.led_state_before_turned_off = XMC_GPIO_GetInput(BOOTLOADER_STATUS_LED_PIN);
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
}

void __attribute__ ((section (".ram_code"))) rpi_sleep_for_duration(uint32_t power_off_duration) {
	// First we set the counter to the amount of seconds we want to sleep
	// We increase the value that the user set by one, since we don't exactly now
	// how long the first RTC second is. We rather sleep a bit too long then
	// too short.
	rpi_sleep_seconds_counter = 1 + (power_off_duration / 1000);

	// Then we enter sleep mode (all hardware units are turned off, decrease frequency to 125kHz, etc)
	rpi_sleep_enter();

	// Use deep sleep mode.
	PPB->SCR |= PPB_SCR_SLEEPDEEP_Msk;

	// Then we disable the flash. From here on everything needs to run in RAM,
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
				rpi.power_off_duration_start = system_timer_get_ms();
				rpi_sleep_for_duration(rpi.power_off_duration);
			}
		}
	} 
}

void rpi_tick(void) {
	rpi_handle_power_off();
}