@ECHO OFF
CLS
REM Create or remove KeyShot junctions.


ECHO	1- Create KeyShot Junctions
ECHO	2- Delete KeyShot Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create


:create
mklink /J "%USERPROFILE%\Documents\KeyShot 7\Renderings"	"%CLOUD%\____Graphics\_Rendering\Keyshot\_Renderings [-J]"

PAUSE
EXIT


:remove
RMDIR "%USERPROFILE%\Documents\KeyShot 7\Renderings"



PAUSE
EXIT

:exit
CLS