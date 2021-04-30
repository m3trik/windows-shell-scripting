@ECHO OFF
CLS
REM create or remove photoshop junctions
goto version




:version
rem set variables
set /p VERSION=Enter Photoshop version (ie.20xx):
ECHO/

goto main




:main
ECHO	1- Create junctions for Adobe Photoshop %VERSION%.
ECHO	2- Delete junctions for Adobe Photoshop %VERSION%.
ECHO	3- Change version.
ECHO	4- Exit

CHOICE /C:1234

IF ERRORLEVEL 4 goto exit_
IF ERRORLEVEL 3 goto version
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
mklink /J "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop %VERSION%\Plug-ins" "%CLOUD%\Graphics\Photoshop\_symlinks\appdata\Plug-ins"
mklink /J "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop %VERSION%\Presets"  "%CLOUD%\Graphics\Photoshop\_symlinks\appdata\Presets"

goto main



:remove
RMDIR "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop %VERSION%\Plug-ins"
RMDIR "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop %VERSION%\Presets"

goto main



:exit_
CLS
EXIT