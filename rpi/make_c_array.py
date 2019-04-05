#!/usr/bin/env python

print('const uint8_t eeprom_data[8192] = ' + str(map(ord, open('hat_brick.eep').read())).replace('[', '{').replace(']', '}') + ';')
