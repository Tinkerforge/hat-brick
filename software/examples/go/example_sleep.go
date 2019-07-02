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

	// Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
	hat.SetSleepMode(2000, 1800000, true, true, true)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
