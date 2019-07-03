use std::{error::Error, io};

use tinkerforge::{hat_brick::*, ip_connection::IpConnection};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XXYYZZ"; // Change XXYYZZ to the UID of your HAT Brick.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let hat = HatBrick::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Get current get voltages.
    let voltages = hat.get_voltages().recv()?;

    println!("Voltage USB: {} V", voltages.voltage_usb as f32 / 1000.0);
    println!("Voltage DC: {} V", voltages.voltage_dc as f32 / 1000.0);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
