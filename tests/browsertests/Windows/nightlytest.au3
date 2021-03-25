#region --- Au3Recorder generated code Start (v3.3.9.5 KeyboardLayout=00000813)  ---

#region --- Internal functions Au3Recorder Start ---
Func _Au3RecordSetup()
Opt('WinWaitDelay',100)
Opt('WinDetectHiddenText',1)
Opt('MouseCoordMode',0)
Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
If $aResult[1] <> '00000813' Then
  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000813->' & $aResult[1] & ')')
EndIf

EndFunc

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

_AU3RecordSetup()
#endregion --- Internal functions Au3Recorder End ---

If $CmdLine[0] <> 1 Then
   MsgBox(64, 'Error', 'Need a PIN code on the command line!')
   Exit(1)
EndIf

Run('C:\Program Files\Firefox Nightly\firefox.exe')
_WinWaitActivate("Firefox Nightly","")
Send("https:{SHIFTDOWN}::{SHIFTUP}pfsense{SHIFTDOWN};{SHIFTUP}pass{SHIFTDOWN};{SHIFTUP}lan:20443{ENTER}")
_WinWaitActivate("User Identification Request","")
Send("{ENTER}")
_WinWaitActivate("Asking PIN","", 120)
If Not WinExists("Asking PIN") Then
   Exit(1)
EndIf
Send($CmdLine[1] & "{ENTER}")
_WinWaitActivate("PHP 7.3.19-1~deb10u1 - phpinfo() — Firefox Nightly","",120)
If Not WinExists("PHP 7.3.19-1~deb10u1 - phpinfo() — Firefox Nightly") Then
   Exit(2)
EndIf
Send("{ALTDOWN}{F4}{ALTUP}")
#endregion --- Au3Recorder generated code End ---
