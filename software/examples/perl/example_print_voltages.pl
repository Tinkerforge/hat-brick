#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickHAT;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XXYYZZ'; # Change XXYYZZ to the UID of your HAT Brick

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $hat = Tinkerforge::BrickHAT->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current get voltages
my ($voltage_usb, $voltage_dc) = $hat->get_voltages();

print "Voltage USB: " . $voltage_usb/1000.0 . " V\n";
print "Voltage DC: " . $voltage_dc/1000.0 . " V\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
