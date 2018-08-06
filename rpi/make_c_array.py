#!/usr/bin/env python

print('const uint8_t eeprom_data[] = ' + str(map(ord, open('hat_bricklet.eep').read())).replace('[', '{').replace(']', '}') + ';')
