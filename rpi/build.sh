#!/bin/bash

rm hat_brick_ds1307.eep spi_ds1307.dtb ../software/src/eeprom_data_ds1307.c
rm hat_brick_pcf8523.eep spi_pcf8523.dtb ../software/src/eeprom_data_pcf8523.c
rm hat_brick.eep spi.dtb ../software/src/eeprom_data.c

dtc -@ -I dts -O dtb -o spi_ds1307.dtb spi_ds1307.dts
dtc -@ -I dts -O dtb -o spi.dtb spi_ds1307.dts
dtc -@ -I dts -O dtb -o spi_pcf8523.dtb spi_pcf8523.dts
eepmake eeprom_settings.txt hat_brick_ds1307.eep spi_ds1307.dtb
eepmake eeprom_settings.txt hat_brick.eep spi.dtb
eepmake eeprom_settings.txt hat_brick_pcf8523.eep spi_pcf8523.dtb

echo "// generated by ../../rpi/build.sh" > ../software/src/eeprom_data_ds1307.c
echo "#include <stdint.h>" >> ../software/src/eeprom_data_ds1307.c
python3 -c "print('const uint8_t eeprom_data_ds1307[] = ' + str(list(open('hat_brick_ds1307.eep', 'rb').read())).replace('[', '{').replace(']', '}') + ';')" >> ../software/src/eeprom_data_ds1307.c

echo "// generated by ../../rpi/build.sh" > ../software/src/eeprom_data_pcf8523.c
echo "#include <stdint.h>" >> ../software/src/eeprom_data_pcf8523.c
python3 -c "print('const uint8_t eeprom_data_pcf8523[] = ' + str(list(open('hat_brick_pcf8523.eep', 'rb').read())).replace('[', '{').replace(']', '}') + ';')" >> ../software/src/eeprom_data_pcf8523.c

echo "// generated by ../../rpi/build.sh" > ../software/src/eeprom_data.c
echo "#include <stdint.h>" >> ../software/src/eeprom_data.c
python3 -c "print('const uint8_t eeprom_data[] = ' + str(list(open('hat_brick.eep', 'rb').read())).replace('[', '{').replace(']', '}') + ';')" >> ../software/src/eeprom_data.c
