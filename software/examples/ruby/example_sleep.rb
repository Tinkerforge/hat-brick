#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/brick_hat'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XXYYZZ' # Change XXYYZZ to the UID of your HAT Brick

ipcon = IPConnection.new # Create IP connection
hat = BrickHAT.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
hat.set_sleep_mode 2, 1800, true, true, true

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
