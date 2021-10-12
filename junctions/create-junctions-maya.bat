@ECHO OFF
CLS
goto main


:main
ECHO	Create or remove Maya junctions.
ECHO\
ECHO	1- Create Maya Junctions
ECHO	2- Delete Maya Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit_
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
mklink /J "%USERPROFILE%\Documents\maya" "%CLOUD%\Graphics\Maya\_symlinks"
goto main


:remove
RMDIR "%USERPROFILE%\Documents\maya"
goto main


:exit_
PAUSE
EXIT
