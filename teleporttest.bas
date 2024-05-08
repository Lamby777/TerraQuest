$NoPrefix
Option Explicit
Dim CommandString As String
Dim CommandBase As String
Dim Parameters(10) As String
Dim LastPos
Dim i, ii
CommandString = ":link -43:4:25:32"

'yeah i literally just copied and pasted the command parameter parser and modified it slightly, i dont care fuck me
CommandString = CommandString + ":" 'adds an aditional space to the end of the command string so the parameter parse function can actually grab the last parameter
CommandBase = LCase$(Trim$(Left$(CommandString, InStr(CommandString, " ")))) 'parses out the base command into a seperate string
LastPos = InStr(CommandString, " ") 'pulls the start position of the first parameter (assuming only 1 space before the parameter, awaiting testing for various garbage inputs and thing not expected
'parses command parameters into an array to make managing a bit easier
For i = 0 To 4

    Parameters(i) = LCase$(Trim$(Mid$(CommandString, LastPos, InStr(LastPos + 1, CommandString, ":") - LastPos)))
    If Left$(Parameters(i), 1) = ":" Then Parameters(i) = Right$(Parameters(i), Len(Parameters(i)) - 1)
    LastPos = InStr(LastPos + 1, CommandString, ":")
    If Parameters(i) = CommandBase Then Exit For 'kills looping for additional parameters that dont exist and eventually just pulling the command as parameters... not that it really matters, nor does this actually work
Next

Print CommandString
For i = 0 To 10
    Print i;
    Print Parameters(i)
Next
Print CommandBase


