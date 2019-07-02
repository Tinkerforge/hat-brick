var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XXYYZZ'; // Change XXYYZZ to the UID of your HAT Brick

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var hat = new Tinkerforge.BrickHAT(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Get current get voltages
        hat.getVoltages(
            function (voltageUSB, voltageDC) {
                console.log('Voltage USB: ' + voltageUSB/1000.0 + ' V');
                console.log('Voltage DC: ' + voltageDC/1000.0 + ' V');
            },
            function (error) {
                console.log('Error: ' + error);
            }
        );
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
