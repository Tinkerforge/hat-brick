function matlab_example_sleep()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickHAT;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XXYYZZ'; % Change XXYYZZ to the UID of your HAT Brick

    ipcon = IPConnection(); % Create IP connection
    hat = handle(BrickHAT(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
    hat.setSleepMode(2000, 1800000, true, true, true);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
