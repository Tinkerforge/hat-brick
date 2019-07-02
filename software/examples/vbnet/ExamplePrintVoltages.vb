Imports System
Imports Tinkerforge

Module ExamplePrintVoltages
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XXYYZZ" ' Change XXYYZZ to the UID of your HAT Brick

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim hat As New BrickHAT(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get current get voltages
        Dim voltageUSB, voltageDC As Integer

        hat.GetVoltages(voltageUSB, voltageDC)

        Console.WriteLine("Voltage USB: " + (voltageUSB/1000.0).ToString() + " V")
        Console.WriteLine("Voltage DC: " + (voltageDC/1000.0).ToString() + " V")

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
