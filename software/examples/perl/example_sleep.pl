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

# Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
$hat->set_sleep_mode(2, 1800, 1, 1, 1);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
