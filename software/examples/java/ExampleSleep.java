import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickHAT;

public class ExampleSleep {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XXYYZZ to the UID of your HAT Brick
	private static final String UID = "XXYYZZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickHAT hat = new BrickHAT(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
		hat.setSleepMode(2000, 1800000, true, true, true);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
