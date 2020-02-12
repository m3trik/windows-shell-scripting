@ECHO OFF

CLS
ECHO	**Sets the Environment Variables for the selected option**
ECHO.
ECHO	Set Variables for:
ECHO	0- Cloud
ECHO	1- Python
ECHO	2- Maya

CHOICE /C:012

IF errorlevel 2 goto Maya
IF errorlevel 1 goto Python
IF errorlevel 0 goto Cloud




:Cloud
set cloudDir=O:\Cloud
ECHO	Add: User Variable: %CLOUD%=cloudDir; ?
PAUSE
set CLOUD=%CLOUD%; cloudDir;


:Maya
ECHO	Add: System Variable: %MAYA_APP_DIRECTORY% = mayaAppDir ?
PAUSE
set MAYA_APP_DIRECTORY=%MAYA_APP_DIRECTORY%; mayaAppDir;


:Python
set pythonPath=%APPDATA%\Python\Scripts;%CLOUD%\_Code\Python\__path;%CLOUD%\_Code\Qt\__path;%CLOUD%\__portable\_scripts\;%CLOUD%\__portable\_scripts\ui;%CLOUD%\__portable\_scripts\maya\slots;%CLOUD%\__portable\_scripts\max\slots;Windows: ../Python/Lib/site-packages
ECHO	Add: System Variable: %PYTHONPATH% = pythonPath ?
PAUSE
set PYTHONPATH=%PYTHONPATH%;


PAUSE
EXIT
