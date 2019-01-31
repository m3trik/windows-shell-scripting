@ECHO OFF
CLS
ECHO	Create or remove Maya junctions.


ECHO	1- Create Maya Junctions
ECHO	2- Delete Maya Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
mklink /J "%USERPROFILE%\Documents\maya"	"%CLOUD%\__Graphics\Maya\Preferences\_app_dir_startup [-J]"



PAUSE
EXIT


:remove
RMDIR "%USERPROFILE%\Documents\maya"



PAUSE
EXIT

:exit
CLS