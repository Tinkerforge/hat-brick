<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickHAT.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickHAT;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XXYYZZ'; // Change XXYYZZ to the UID of your HAT Brick

$ipcon = new IPConnection(); // Create IP connection
$hat = new BrickHAT(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
$hat->setSleepMode(2, 1800, TRUE, TRUE, TRUE);

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
