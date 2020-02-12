@ECHO OFF
CLS
ECHO	**If you have not already, you must first delete or zip original folders in default program directory so that the script is able to populate a new junction link in its place.**
ECHO.
ECHO	Create junction for:
ECHO	1- project cars
ECHO	2- 
ECHO	3- 
ECHO	4- 
ECHO	5- exit

CHOICE /C:12345
IF errorlevel 5 goto 
IF errorlevel 4 goto 
IF errorlevel 3 goto 
IF errorlevel 2 goto 
IF errorlevel 1 goto project cars

:project cars
mklink /J "" "%CLOUD%\"

PAUSE
EXIT

:exit
CLS

;comment