#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XXYYZZ" # Change XXYYZZ to the UID of your HAT Brick

from tinkerforge.ip_connection import IPConnection
from tinkerforge.brick_hat import BrickHAT

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    hat = BrickHAT(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Get current get voltages
    voltage_usb, voltage_dc = hat.get_voltages()

    print("Voltage USB: " + str(voltage_usb/1000.0) + " V")
    print("Voltage DC: " + str(voltage_dc/1000.0) + " V")

    input("Press key to exit\n") # Use raw_input() in Python 2
    ipcon.disconnect()
