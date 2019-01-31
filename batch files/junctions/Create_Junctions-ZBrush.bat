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
mklink /J "%directory%\ZProjects" "%CLOUD%\__Graphics\Zbrush\ZProjects [-J]"

mklink /J "%directory%\ZScripts" "%CLOUD%\__Graphics\Zbrush\__Zscripts\___Zscripts [-J]"

mklink /J "%directory%\ZStartup\ZPlugs" "%CLOUD%\__Graphics\Zbrush\__Plug-ins\___ZPlugs [-J]"

mklink /J "%directory%\ZStartup\ZPlugs64" "%CLOUD%\__Graphics\Zbrush\__Plug-ins\___ZPlugs64 [-J]"

mklink /J "%directory%\ZStartup\BrushPresets" "%CLOUD%\__Graphics\Zbrush\brushes\___Brush Presets [-J]"

PAUSE
EXIT


:remove
RMDIR	"%directory%\ZProjects"

RMDIR	"%directory%\ZScripts"

RMDIR	"%directory%\ZStartup\ZPlugs"

RMDIR	"%directory%\ZStartup\ZPlugs64"

RMDIR	"%directory%\ZStartup\BrushPresets"

PAUSE
EXIT


:exit
CLS