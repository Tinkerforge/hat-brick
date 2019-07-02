function octave_example_print_voltages()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XXYYZZ"; % Change XXYYZZ to the UID of your HAT Brick

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    hat = javaObject("com.tinkerforge.BrickHAT", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current get voltages
    voltages = hat.getVoltages();

    fprintf("Voltage USB: %g V\n", voltages.voltageUSB/1000.0);
    fprintf("Voltage DC: %g V\n", voltages.voltageDC/1000.0);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
