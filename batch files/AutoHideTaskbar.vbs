' ***************************************************************************************
' AutoHideTaskbar.vbs	
' This script enables or disables the "Auto-Hide the taskbar" option by sending Alt+u key
' when the tray properties are been opened
' Modify the variable cSendKeyValue with any of the values below
' %l - Alt+l - Lock the taskbar
' %u - Alt+u - Auto-hide the taskbar
' %t - Alt+t - Keep the taskbar on top
' %g - Alt+g - Group similar taskbar buttons
' %q - Alt+q - Show Quick launch
' %k - Alt+k - Show the clock
' %h - Alt+h - Hide inactive icons
' ***************************************************************************************

cSendKeyValue = "%u"		' Alt+u = Auto-hide the taskbar 
Set WshShell = Wscript.CreateObject("Wscript.shell") 
Set oShell = CreateObject("Shell.Application") 
oShell.TrayProperties 

Wscript.Sleep 500 
WshShell.SendKeys cSendKeyValue                        

Wscript.Sleep 250 
WshShell.SendKeys "{ENTER}"           ' Enter to Close Properties 

Set oShell = Nothing 
WScript.Quit 