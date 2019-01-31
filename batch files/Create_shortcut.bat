@echo off
cls

rem create windows shortcut. shortcutjs.bat is an external javascript/bat hybrid file that needs to be in the same folder or called explicitly.


shortcutjs.bat -linkfile "%USERPROFILE%\Desktop\testFolder.lnk" -target "%USERPROFILE%\Desktop\new folder" -workingdirectory "%USERPROFILE%\Desktop" -adminpermissions yes
rem -linkarguments linkarguments  
rem -description description
rem -iconlocation iconlocation
rem -hotkey hotkey]
rem -windowstyle 1|3|7



pause