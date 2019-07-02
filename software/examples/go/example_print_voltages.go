package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/hat_brick"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
)

const ADDR string = "localhost:4223"
const UID string = "XXYYZZ" // Change XXYYZZ to the UID of your HAT Brick.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	hat, _ := hat_brick.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	// Get current get voltages.
	voltageUSB, voltageDC, _ := hat.GetVoltages()

	fmt.Printf("Voltage USB: %f V\n", float64(voltageUSB)/1000.0)
	fmt.Printf("Voltage DC: %f V\n", float64(voltageDC)/1000.0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
