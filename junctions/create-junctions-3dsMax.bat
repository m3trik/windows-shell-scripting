@ECHO OFF
CLS
ECHO Create or remove 3ds Max junctions.
ECHO Attempts to compress the contents at the original dir location if it is present.
ECHO/
set "WINRAR=%ProgramFiles%\WinRAR\Rar.exe"
set "DEST=%CLOUD%\Graphics\3ds Max\_symlinks\preferences"

goto version




:version
rem set variables (deprecated)
rem set /p VERSION=Enter 3ds Max version (ie.20xx):
ECHO/
set "SOURCE=%USERPROFILE%\AppData\Local\Autodesk\3dsMax"

goto main




:main
ECHO	1- Create 3ds Max Junctions at %DEST% for 3ds Max %VERSION%.
ECHO	2- Delete Existing 3ds Max Junctions for 3ds Max %VERSION%.
ECHO	3- Set version.
ECHO	4- EXIT

CHOICE /C:1234

IF ERRORLEVEL 4 goto exit_
IF ERRORLEVEL 3 goto version
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
rem set working directory
CD /d %SOURCE%

rem compress existing file.
:: UI folder
"%WINRAR%" a -r -y -df -idq "%SOURCE%.rar" "%SOURCE%"
mklink /J "%SOURCE%" "%DEST%"
echo/

goto main





:remove
rem remove junction
if exist "%SOURCE%"
(
	RMDIR "%SOURCE%"
)

rem if backup rar file exists; extract the orig folder
if exist "%SOURCE%.rar"
(
	"%WINRAR%" x -y "%SOURCE%.rar"
)
rem delete rar file
if exist "%SOURCE%.rar"
(
	del "%SOURCE%.rar"
)

goto main





:exit_
CLS
EXIT