@ECHO OFF
CLS
goto main


:main
ECHO	Create or remove Blender junctions.
ECHO\
ECHO	1- Create Blender Junctions
ECHO	2- Delete Blender Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit_
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
mklink /J "%APPDATA%\Blender Foundation\Blender" "%CLOUD%\Graphics\Blender\_symlinks"
goto main


:remove
RMDIR "%APPDATA%\Blender Foundation\Blender"
goto main


:exit_
PAUSE
EXIT
