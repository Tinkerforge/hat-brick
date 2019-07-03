#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XXYYZZ # Change XXYYZZ to the UID of your HAT Brick

# Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
tinkerforge call hat-brick $uid set-sleep-mode 2 1800 true true true
