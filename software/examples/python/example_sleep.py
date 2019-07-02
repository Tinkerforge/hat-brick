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

    # Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
    hat.set_sleep_mode(2000, 1800000, True, True, True)

    raw_input("Press key to exit\n") # Use input() in Python 3
    ipcon.disconnect()
