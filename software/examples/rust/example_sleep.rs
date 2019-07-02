use std::{io, error::Error};

use tinkerforge::{ip_connection::IpConnection,
                  hat_brick::*};


const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XXYYZZ"; // Change XXYYZZ to the UID of your HAT Brick.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let hat = HatBrick::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
    // Don't use device before ipcon is connected.

		// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
		hat.set_sleep_mode(2000, 1800000, true, true, true);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
