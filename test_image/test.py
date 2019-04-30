#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# image at:
# download.tinkerforge.com/_stuff/raspbian_hat_brick_test_image.img

HOST = "localhost"
PORT = 4223

from tinkerforge.ip_connection import IPConnection
from tinkerforge.brick_hat import BrickHAT
from tinkerforge.brick_hat_zero import BrickHATZero

import subprocess
import time
import sys
from termcolor import colored

def ok(s):
    print(colored(s, 'green'))

def okdone():
    print(colored('--> HAT Brick TEST OK <--', 'green', attrs=['bold', 'blink']))


def fail(s):
    print(colored(s, 'red'))
    print(colored('--> TEST FAILED <--', 'red', attrs=['bold', 'blink']))
    sys.exit(1)
        
hat_type = None
enum_done = False
enum_count = 0
bricklet_num = 4

hat_uid = None

enums_hat = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']
enums_hat_zero = ['a', 'b', 'c', 'd', 'e']

def cb_enumerate(uid, connected_uid, position, hardware_version, firmware_version, device_identifier, enumeration_type):
#    print(uid, connected_uid, position, hardware_version, firmware_version, device_identifier, enumeration_type)
    global enum_done
    global hat_type
    global enum_count
    global enums_hat
    global enums_hat_zero
    global hat_uid

    if hat_type == 0:
        if position in enums_hat:
            try:
                enums_hat.remove(position)
            except:
                print('Found Bricklet at port {0} twice'.format(position))
                return

            enum_count += 1
            if device_identifier == 111 and position == 'i':
                hat_uid = uid
                ok('Found HAT Brick')
            else:
                ok('Found Bricklet at port {0}'.format(position))
            if enum_count == 9:
                enum_done = True
    elif hat_type == 1:
        if position in enums_hat_zero:
            try:
                enums_hat_zero.remove(position)
            except:
                print('Found Bricklet at port {0} twice'.format(position))
                return

            enum_count += 1
            if device_identifier == 112 and position == 'e':
                hat_uid = uid
                ok('Found HAT Zero Brick')
            else:
                ok('Found Bricklet at port {0}'.format(position))
            if enum_count == 5:
                enum_done = True

if __name__ == "__main__":
    try:
        product_id =  open('/proc/device-tree/hat/product_id').read().replace('\0', '')
    except:
        fail('Could not read /proc/device-tree/hat/product_id')

    if product_id == '0x084e':
        ok('Found product id 0x084e (HAT Brick)')
        hat_type = 0
        bricklet_num = 8
    elif product_id == '0x085d':
        ok('Found product id 0x085d (HAT Zero Brick)')
        hat_type = 1
    else:
        fail('Unknown product id: {0}'.format(product_id))

    ipcon = IPConnection()
    ipcon.connect(HOST, PORT) 

    ipcon.register_callback(IPConnection.CALLBACK_ENUMERATE, cb_enumerate)
    ipcon.enumerate()

    start = time.time()
    while time.time() - start < 1:
        time.sleep(0.1)
        if enum_done:
            break
    if not enum_done:
        fail('Did not find 1 HAT and {0} Bricklets within one second'.format(bricklet_num))
    else:
        ok('Found 1 HAT and {0} Bricklets within one second'.format(bricklet_num))

    if hat_type == 0:
        try:
            hat = BrickHAT(hat_uid, ipcon)
            voltage_usb, voltage_dc = hat.get_voltages()
        except:
            fail('Could not get HAT voltages')

        lsmod = subprocess.check_output("lsmod", shell=True)
        if 'rtc_pcf8523' in str(lsmod):
            ok('RTC PCF8523 driver installed')
        else:
            fail('RTC PCF8523 driver not found')

        if voltage_usb < 4000 or voltage_usb > 6000:
            fail('Voltage USB not in range: {0:.1f}V (expected 4V-6V)'.format(voltage_usb/1000.0))
        elif voltage_dc < 23000 or voltage_usb > 25000:
            fail('Voltage DC not in range: {0:.1f}V (expected 23V-25V)'.format(voltage_dc/1000.0))
        else:
            ok('Voltages: USB {0:.1f}V, DC {1:.1f}V'.format(voltage_usb/1000.0, voltage_dc/1000.0))
            okdone()
    elif hat_type == 1:
        try:
            hat = BrickHATZero(hat_uid, ipcon)
            voltage_usb = hat.get_usb_voltage()
        except:
            fail('Could not get HAT Zero USB voltage')

        if voltage_usb < 4000 or voltage_usb > 6000:
            fail('Voltage USB not in range: {0:.1f}V (expected 4V-6V)'.format(voltage_usb/1000.0))
        else:
            ok('Voltage USB {0:.1f}V'.format(voltage_usb/1000.0))
            okdone()

    ipcon.disconnect()
