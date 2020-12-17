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
rem mklink /J "C:\Program Files\Allegorithmic\Substance Painter 2\PlugIns" 	"%CLOUD%\__Graphics\apps\Substance\_Plugins [-J]"
mklink /J "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\plugins"		"%CLOUD%\__Graphics\apps\Substance\_Plugins [-J]"
mklink /J "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\shelf"		"%CLOUD%\__Graphics\apps\Substance\_Shelf [-J]"

PAUSE
EXIT


:remove
rem RMDIR "C:\Program Files\Allegorithmic\Substance Painter 2\PlugIns"
RMDIR "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\Plugins"
RMDIR "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\shelf"


PAUSE
EXIT

:exit
CLS