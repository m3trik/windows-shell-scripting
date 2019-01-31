@ECHO OFF
CLS
ECHO Create or remove 3ds Max junctions.

rem variables
set /p VERSION=Enter 3ds Max version: 

set "WINRAR=%ProgramFiles%\WinRAR\Rar.exe"
set "DIR1=%USERPROFILE%\AppData\Local\Autodesk\3dsMax\%VERSION% - 64bit\ENU"
set "DIR2=%CLOUD%\__Graphics\3ds Max\Preferences [-j]"

set "JUNC1=%DIR1%\en-US\UI"
set "SYM1=%DIR1%\3dsMax.ini"
set "SYM2=%DIR1%\MXS_EditorUser.properties"

echo %DIR1%
echo.





ECHO	1- Create 3ds Max Junctions
ECHO	2- Delete 3ds Max Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create





:create
rem set working DIRectory
CD /d %DIR1%\en-US\

rem compress existing file.
"%WINRAR%" a -r -y -df -idq "%JUNC1%.rar" "%JUNC1%"
if exist %JUNC1%.rar
(
	echo.
	echo created: %JUNC1%.rar
)
mklink /J "%JUNC1%" "%DIR2%\UI"



rem repeat for additional files.
CD /d %DIR1%

"%WINRAR%" a -r -y -df -idq -ep "%SYM1%.rar" "%SYM1%"
if exist %SYM1%.rar 
(
	echo.
	echo created: %SYM1%.rar
)
mklink "%SYM1%" "%DIR2%\3dsMax.ini"



"%WINRAR%" a -r -y -df -idq -ep "%SYM2%.rar" "%SYM2%"
if exist %SYM2%.rar
(
	echo.
	echo created: %SYM2%.rar
)
mklink "%SYM2%" "%DIR2%\MXS_EditorUser.properties"


PAUSE
EXIT





:remove
rem remove junction
if exist "%JUNC1%"
(
	RMDIR "%JUNC1%"
)

rem if backup rar file exists; extract the orig folder
if exist "%JUNC1%.rar"
(
	"%WINRAR%" x -y "%JUNC1%.rar"
)
rem delete rar file
if exist "%JUNC1%.rar"
(
	del "%JUNC1%.rar"
)


rem repeat for additional files.
rem remove symbolic link
if exist "%SYM1%"
(
	del "%SYM1%"
)
rem if backup rar file exists; extract the orig folder
if exist "%SYM1%.rar"
(
	"%WINRAR%" x -y "%SYM1%.rar"
)
rem delete rar file
if exist "%SYM1%.rar"
(
	del "%SYM1%.rar"
)

rem remove symbolic link
if exist "%SYM2%"
(
	del "%SYM2%"
)
rem if backup rar file exists; extract the orig folder
if exist "%SYM2%.rar"
(
	"%WINRAR%" x -y "%SYM2%.rar"
)
rem delete rar file
if exist
(
	"%SYM2%.rar" del "%SYM2%.rar"
)


PAUSE
EXIT





:exit
CLS