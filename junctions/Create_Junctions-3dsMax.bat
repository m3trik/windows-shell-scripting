@ECHO OFF
CLS
ECHO Create or remove 3ds Max junctions.
ECHO Compresses and deletes the contents at the original dir location if they are present.
ECHO/

rem set variables
set /p VERSION=Enter 3ds Max version: 
ECHO/

set "WINRAR=%ProgramFiles%\WinRAR\Rar.exe"
set "DEST=%CLOUD%\__Graphics\apps\3ds Max\ENU -j"
set "SOURCE=%USERPROFILE%\AppData\Local\Autodesk\3dsMax\%VERSION% - 64bit\ENU"


goto main





:create
rem set working directory
CD /d %SOURCE%

rem compress existing file.
::UI folder
"%WINRAR%" a -r -y -df -idq "%SOURCE%.rar" "%SOURCE%"
mklink /J "%SOURCE%" "%DEST%"
echo/

PAUSE
CLS
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


PAUSE
CLS
goto main





:main
ECHO	1- Create 3ds Max Junctions at %DEST%
ECHO	2- Delete Existing 3ds Max Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit_
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create


:exit_
CLS
PAUSE