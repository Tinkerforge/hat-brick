#!/bin/bash

rm hat_brick_ds1307.eep spi_ds1307.dtb
rm hat_brick_pcf8523.eep spi_pcf8523.dtb
rm ../software/src/eeprom_data.c ../software/src/eeprom_data.h

dtc -@ -I dts -O dtb -o spi_ds1307.dtb spi_ds1307.dts
dtc -@ -I dts -O dtb -o spi_pcf8523.dtb spi_pcf8523.dts

eepmake eeprom_settings.txt hat_brick_ds1307.eep spi_ds1307.dtb
eepmake eeprom_settings.txt hat_brick_pcf8523.eep spi_pcf8523.dtb

python3 create_eeprom_data_c.py
