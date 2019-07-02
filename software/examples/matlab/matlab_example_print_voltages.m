function matlab_example_print_voltages()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickHAT;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XXYYZZ'; % Change XXYYZZ to the UID of your HAT Brick

    ipcon = IPConnection(); % Create IP connection
    hat = handle(BrickHAT(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current get voltages
    voltages = hat.getVoltages();

    fprintf('Voltage USB: %g V\n', voltages.voltageUSB/1000.0);
    fprintf('Voltage DC: %g V\n', voltages.voltageDC/1000.0);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
