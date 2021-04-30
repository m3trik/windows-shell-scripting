@ECHO OFF
CLS
REM Create or remove Substance Painter/Designer junctions.




:main
ECHO	1- Create Substance Junctions.
ECHO	2- Delete Substance Junctions.
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit_
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
rem mklink /J "C:\Program Files\Allegorithmic\Substance Painter 2\PlugIns" 	"%CLOUD%\__Graphics\apps\Substance\_Plugins [-J]"
mklink /J "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\plugins"		"%CLOUD%\Graphics\Substance Painter\_symlinks\plugins"
mklink /J "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\shelf"		"%CLOUD%\Graphics\Substance Painter\_symlinks\shelf"

goto main




:remove
rem RMDIR "C:\Program Files\Allegorithmic\Substance Painter 2\PlugIns"
RMDIR "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\Plugins"
RMDIR "%USERPROFILE%\Documents\Allegorithmic\Substance Painter\shelf"

goto main




:exit_
CLS