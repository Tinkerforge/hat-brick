Imports System
Imports Tinkerforge

Module ExampleSleep
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XXYYZZ" ' Change XXYYZZ to the UID of your HAT Brick

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim hat As New BrickHAT(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Turn Raspberry Pi and Bricklets off in 2 seconds for 30 minutes with sleep indicator enabled
        hat.SetSleepMode(2, 1800, True, True, True)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
