@ECHO OFF
CLS
REM create or remove Sublime Text junctions
;comment

ECHO	1- Create Junctions
ECHO	2- Delete Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create


:create
REM Sublime text 2
mklink /J "%USERPROFILE%\AppData\Roaming\Sublime Text 2"         		"%CLOUD%\_Coding\_IDE\Sublime\Sublime Text 2 [-J]"

REM Sublime text 3
mklink /J "%USERPROFILE%\AppData\Roaming\Sublime Text 3"			"%CLOUD%\_Coding\_IDE\Sublime\Sublime Text 3 [-J]"
mklink /J "C:\Program Files\Sublime Text 3\Packages" 	"%CLOUD%\_Coding\_IDE\Sublime\Packages [-J]"

PAUSE
EXIT

:remove
REM Sublime text 2
RMDIR "%USERPROFILE%\AppData\Roaming\Sublime Text 2"

REM Sublime text 3
RMDIR "%USERPROFILE%\AppData\Roaming\Sublime Text 3"
RMDIR "C:\Program Files\Sublime Text 3\Packages"

PAUSE
EXIT

:exit
CLS
