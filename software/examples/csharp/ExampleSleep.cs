using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XXYYZZ"; // Change XXYYZZ to the UID of your HAT Brick

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickHAT hat = new BrickHAT(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
		hat.SetSleepMode(2000, 1800000, true, true, true);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
