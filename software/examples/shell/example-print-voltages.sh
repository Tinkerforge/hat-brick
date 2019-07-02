#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XXYYZZ # Change XXYYZZ to the UID of your HAT Brick

# Get current get voltages
tinkerforge call hat-brick $uid get-voltages
