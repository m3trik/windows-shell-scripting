@ECHO OFF
CLS
REM Create or remove Substance Painter/Designer junctions.


ECHO	1- Create Substance Junctions
ECHO	2- Delete Substance Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create


:create
mklink /J "C:\Program Files\Allegorithmic\Substance Painter 2\PlugIns" 	"%CLOUD%\__Graphics\apps\Substance\_Plugins [-J]"
mklink /J "%USERPROFILE%\Documents\Substance Painter 2\plugins"		"%CLOUD%\__Graphics\apps\Substance\_Plugins [-J]"
mklink /J "%USERPROFILE%\Documents\Substance Painter 2\shelf"		"%CLOUD%\__Graphics\apps\Substance\_Shelf [-J]"

PAUSE
EXIT


:remove
RMDIR "C:\Program Files\Allegorithmic\Substance Painter 2\PlugIns"
RMDIR "%USERPROFILE%\Documents\Substance Painter 2\Plugins"
RMDIR "%USERPROFILE%\Documents\Substance Painter 2\shelf"


PAUSE
EXIT

:exit
CLS