@echo off
cls

rem create windows shortcut. shortcutjs.bat is an external javascript/bat hybrid file that needs to be in the same folder or called explicitly.


shortcutjs.bat -linkfile "C:\Users\m3\Desktop\testFolder.lnk" -target "C:\Users\m3\Desktop\come_on_in" -workingdirectory "C:\Users\m3\Desktop" -adminpermissions yes
rem -linkarguments linkarguments  
rem -description description
rem -iconlocation iconlocation
rem -hotkey hotkey]
rem -windowstyle 1|3|7



pause