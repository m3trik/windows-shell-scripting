@echo OFF
CLS
echo.
echo	**If you have not already, you must first move and delete or zip original folders in default program directory so that the script is able to populate a new junction link in its place.**
goto version




:version
echo.
set /p version=Enter the zbrush version (ie.20xx):
set directory=%ProgramFiles%\Pixologic\ZBrush %version%

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
mklink /J "%directory%\ZScripts" "%CLOUD%\Graphics\Zbrush\_symlinks\ZScripts"
mklink /J "%directory%\ZStartup" "%CLOUD%\Graphics\Zbrush\_symlinks\ZStartup"

goto main




:remove
RMDIR	"%directory%\ZScripts"
RMDIR	"%directory%\ZStartup"

goto main




:exit_
CLS