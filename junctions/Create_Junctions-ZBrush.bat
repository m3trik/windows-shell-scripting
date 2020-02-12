@echo OFF
CLS

echo.
echo	**If you have not already, you must first move and delete or zip original folders in default program directory so that the script is able to populate a new junction link in its place.**

echo.
set /p version= zbrush version? (ie.20xx):
set version=ZBrush %version%
set directory=C:\Program Files\Pixologic\
set directory=%directory%%version%
echo %directory%

echo.
echo	1- create zbrush junctions
echo	2- remove zbrush junctions
echo	3- exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create





:create
mklink /J "%directory%\ZScripts" "%CLOUD%\__Graphics\apps\Zbrush\__Zscripts [-j]"
mklink /J "%directory%\ZStartup" "%CLOUD%\__Graphics\apps\Zbrush\__ZStartup [-j]"

PAUSE
EXIT




:remove
RMDIR	"%directory%\ZScripts"
RMDIR	"%directory%\ZStartup"

PAUSE
EXIT





:exit
CLS