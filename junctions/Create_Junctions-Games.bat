@ECHO OFF
CLS

ECHO	**If you have not already, you must first delete or zip original folders in default program directory so that the script is able to populate a new junction link in its place.**
ECHO.
goto main


:main
ECHO	Create junctions for:
ECHO	1- Project Cars
ECHO	2- Age of Empires 3
ECHO	3- 
ECHO	4- 
ECHO	5- exit

CHOICE /C:12345

IF errorlevel 5 goto exit
IF errorlevel 4 goto 
IF errorlevel 3 goto 
IF errorlevel 2 goto aoeIII
IF errorlevel 1 goto projectCars

:projectCars
mklink /J "" "%CLOUD%\"
goto main

:aoeIII
mklink /D "%USERPROFILE%\Documents\My Games\Age of Empires 3\cloud" "%\\CLOUD%\Games\AOE" rem create a link to the network drive's dir
mklink /J "%USERPROFILE%\Documents\My Games\Age of Empires 3\Savegame"  "%USERPROFILE%\Documents\My Games\Age of Empires 3\cloud\Savegame"
mklink /J "%USERPROFILE%\Documents\My Games\Age of Empires 3\Scenario"  "%USERPROFILE%\Documents\My Games\Age of Empires 3\cloud\Scenario"
goto main




PAUSE
EXIT

:exit
CLS