function octave_example_sleep()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XXYYZZ"; % Change XXYYZZ to the UID of your HAT Brick

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    hat = javaObject("com.tinkerforge.BrickHAT", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
    hat.setSleepMode(2, 1800, true, true, true);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
