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

// Get current get voltages
$voltages = $hat->getVoltages();

echo "Voltage USB: " . $voltages['voltage_usb']/1000.0 . " V\n";
echo "Voltage DC: " . $voltages['voltage_dc']/1000.0 . " V\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
