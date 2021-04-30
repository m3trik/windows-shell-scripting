@echo OFF
CLS
echo.
echo	**If you have not already, you must first move and delete or zip original folders in default program directory so that the script is able to populate a new junction link in its place.**

:setvars
set /p from=Enter the directory location to symlink from:
set /p to=Enter the directory location to symlink to:

goto main




:main
echo.
echo	1- Create junction: %from% %to%.
echo	2- Reset link directory locations.
echo	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit_
IF ERRORLEVEL 2 goto setvars
IF ERRORLEVEL 1 goto create




:create
ECHO/
mklink /J "%from%" "%to%"

goto setvars



:exit_
CLS