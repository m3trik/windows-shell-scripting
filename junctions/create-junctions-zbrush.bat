@echo OFF
CLS
goto version




:version
echo.
set /p version=Enter the zbrush version (ie.20xx):
set directory=%ProgramFiles%\Pixologic\ZBrush %version%
echo.
echo	**If you have not already, you must first move, delete, or 
echo	zip '\ZScripts' and '\ZStartup' at: %directory% 
echo	so that the script is able to populate a new junction link in their place.**
goto main




:main
echo.
echo	1- Create junctions for ZBrush %VERSION%.
echo	2- Remove junctions for ZBrush %VERSION%.
echo	3- Change version.
echo	4- Exit

CHOICE /C:1234

IF ERRORLEVEL 4 goto exit_
IF ERRORLEVEL 3 goto version
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
ECHO/
mklink /J "%directory%\ZScripts" "%CLOUD%\Graphics\ZBrush\_symlinks\ZScripts"
mklink /J "%directory%\ZStartup" "%CLOUD%\Graphics\ZBrush\_symlinks\ZStartup"

goto main




:remove
RMDIR	"%directory%\ZScripts"
RMDIR	"%directory%\ZStartup"

goto main




:exit_
CLS