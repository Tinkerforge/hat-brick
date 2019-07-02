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

		// Get current get voltages
		int voltageUSB, voltageDC;
		hat.GetVoltages(out voltageUSB, out voltageDC);

		Console.WriteLine("Voltage USB: " + voltageUSB/1000.0 + " V");
		Console.WriteLine("Voltage DC: " + voltageDC/1000.0 + " V");

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
