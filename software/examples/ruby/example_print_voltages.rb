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

# Get current get voltages as [voltage_usb, voltage_dc]
voltages = hat.get_voltages

puts "Voltage USB: #{voltages[0]/1000.0} V"
puts "Voltage DC: #{voltages[1]/1000.0} V"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
