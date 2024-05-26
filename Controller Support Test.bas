$NoPrefix
Option Explicit

Dim DevList, i, DevID
DevList = Devices
           screen newimage(640,480,32)
Do
    Display
    Cls
    Print _Devices
    For i = 1 To DevList
        Print Device$(i)
        Print LastButton(i)
        Print LastAxis(i)
        If InStr(Device$(i), "[CONTROLLER]") > 0 Then
            DevID = i
        End If
    Next
    Print "Funny Sticks"


    Print Stick(0, 1)
    Print Stick(1, 1)
    Print Stick(0, 2)
    Print Stick(1, 2)
    Print Stick(0, 3)
    Print Stick(1, 3)
    Print Stick(0, 4)
    Print Stick(1, 4)

    Print "Buttons (instant, ID | current, ID)"
    For i = 0 To 4 * LastButton(DevID) - 1 Step 4
        Print Strig(i, 1); i; " | "; Strig(i + 1, 1); i + 1
    Next

    Limit 60
Loop
