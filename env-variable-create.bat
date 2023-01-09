@ECHO OFF

rem -----------------------------------------------------------------------
rem **This script must be run as Administrator**

rem SETX: This program is used to set values in the environment
rem		of the machine or currently logged on user using one of three modes.

rem	Command Line Mode: setx variable value [-m]
rem	Optional Switches:
rem		-m  Set value in the Machine environment. Default is User.

rem ex. setx -m JAVA_HOME "C:\Program Files\Java\jdk1.7.0_04"
rem -----------------------------------------------------------------------



CLS
ECHO	** Set Windows Environment Variables. **
ECHO.
ECHO	Set Custom Defined Variable:
ECHO	1- Set User Variable
ECHO	2- Set System Variable
ECHO/
ECHO	..Or Set Variables for:
ECHO	3- Python
ECHO	4- Cloud
ECHO	5- Maya
ECHO	6- 3dsMax

CHOICE /C:123456

if errorlevel 6 goto 3dsMax
if errorlevel 5 goto Maya
if errorlevel 4 goto Cloud
if errorlevel 3 goto Python
if errorlevel 2 goto SetSystemVar
if errorlevel 1 goto SetUserVar




:SetUserVar
set /p var=variable name ?
set /p value=value ?
ECHO	Add: User Variable:
ECHO	%var% = %value%;
ECHO	?
PAUSE
setx %VAR% %VALUE%;
goto exit_


:SetSystemVar
set /p var=variable name ?
set /p value=value ?
ECHO	Add: System Variable:
ECHO	%var% = %value%;
ECHO	?
PAUSE
setx -m %VAR% %VALUE%;
goto exit_


:Cloud
set cloudDir="O:\Cloud"
set cloudRemoteDir="\\M3trik-desktop\o\Cloud"
ECHO	Add: User Variable: 
ECHO	CLOUD = %cloudDir%;
ECHO	\\CLOUD = %cloudRemoteDir%;
ECHO	?
PAUSE
setx CLOUD %cloudDir%;
setx \\CLOUD %cloudRemoteDir%;
goto exit_


:Maya
set mayaAppDir="NONE"
ECHO	Add: System Variable:
ECHO	MAYA_APP_DIRECTORY = %mayaAppDir%
ECHO	?
PAUSE
setx -m  MAYA_APP_DIRECTORY %mayaAppDir%;
goto exit_


:3dsMax
set maxAppDir="NONE"
ECHO	Add: System Variable:
ECHO	NONE = 
ECHO	?
PAUSE
setx -m %maxAppDir%;
goto exit_


:Python
set pythonPath=%APPDATA%\Python\Scripts;%CLOUD%\_Code\Python\__path;%CLOUD%\_Code\Qt\__path;%CLOUD%\__portable\_scripts\;%CLOUD%\__portable\_scripts\ui;%CLOUD%\__portable\_scripts\maya\slots;%CLOUD%\__portable\_scripts\max\slots;Windows: ../Python/Lib/site-packages
ECHO	Add: System Variable:
ECHO	PYTHONPATH=%pythonPath%
ECHO	?
PAUSE
setx -m PYTHONPATH %pythonPath%;
goto exit_


:exit_
PAUSE
EXIT
