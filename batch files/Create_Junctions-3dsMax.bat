@ECHO OFF
CLS
REM Create or remove 3ds Max junctions.


ECHO	1- Create 3ds Max Junctions
ECHO	2- Delete 3ds Max Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create


:create
mklink /J "%USERPROFILE%\AppData\Local\Autodesk\3dsMax\2018 - 64bit\ENU"	"%CLOUD%\____Graphics\3ds Max\_2018 [-J]"
mklink /J "%CLOUD%\____Graphics\3ds Max\_2018 [-J]\scripts"				"%CLOUD%\____Graphics\3ds Max\Scripts"

PAUSE
EXIT


:remove
RMDIR "%USERPROFILE%\AppData\Local\Autodesk\3dsMax\2018 - 64bit\ENU"
RMDIR "%CLOUD%\____Graphics\3ds Max\_2018 [-J]\scripts"


PAUSE
EXIT

:exit
CLS