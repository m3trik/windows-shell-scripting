@ECHO OFF

CLS
ECHO	**Sets the Environment Variables for the selected option**
ECHO.
ECHO	Set User Variables for:
ECHO	0- Cloud Folder Path
ECHO	1- 
ECHO	2- 
ECHO	3-
ECHO	4-
ECHO	5- Maya User Path
ECHO. 
ECHO	Set System Variables for:
ECHO	6- Python Path
ECHO	7- 
ECHO	8- 
ECHO	9- Maya System Path

CHOICE /C:0123456789
IF errorlevel 9 goto Maya_sysVar
IF errorlevel 8 goto 
IF errorlevel 7 goto 
IF errorlevel 6 goto PythonPath_sysVar

IF errorlevel 5 goto Maya_userVar
IF errorlevel 4 goto 
IF errorlevel 3 goto 
IF errorlevel 2 goto 
IF errorlevel 1 goto 
IF errorlevel 0 goto Cloud_userVar








REM set paths here.

set cloudDir=O:\Cloud
set pythonPath=%CLOUD%\_programming\Python\2.7\__path; %CLOUD%\____Graphics\3ds Max\Scripts\__path; %CLOUD%\____Graphics\Maya\Scripts\__path
set mayaAppDir=%CLOUD%\____Graphics\Maya\Preference\_app_dir_startup
set mayaPythonPath=%CLOUD%\____Graphics\Maya\Scripts\__path; %CLOUD%\____Graphics\3ds Max\Scripts\__path








REM	..................................
REM	............::User Variables::....

:Cloud_userVar

REM ===========
REM ==%CLOUD%==
REM ===========
ECHO	User Variable: %CLOUD%=cloudDir;
set CLOUD=%CLOUD%; cloudDir;

PAUSE
EXIT


REM	...................................
REM	...........::System Variables::....

:Maya_sysVar

REM ========================
REM ==%MAYA_APP_DIRECTORY%==
REM ========================
ECHO	System Variable: %MAYA_APP_DIRECTORY% = mayaAppDir
set MAYA_APP_DIRECTORY=%MAYA_APP_DIRECTORY%; mayaAppDir;


:PythonPath_sysVar

REM ================
REM ==%PYTHONPATH%==
REM ================ 
ECHO	System Variable: %PYTHONPATH% = pythonPath, mayaPythonPath
set PYTHONPATH=%PYTHONPATH%; mayaPythonPath;

PAUSE
EXIT
