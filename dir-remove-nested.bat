@ ECHO off
CLS

:start
echo ------------------------------------------------------------------------
echo This script will get rid of any subfolders while keeping their contents.
echo ------------------------------------------------------------------------



:setPath
set /p PARENT_DIR=Parent dir ?
set "MOVETO_DIR=%PARENT_DIR%"
:: filter by filetype. (valid: * (all), *.ext (explicit))
set FILETYPE=*



:: move files in subfolders to top level.
for /r "%PARENT_DIR%" %%i in (%FILETYPE%) do @move "%%i" "%MOVETO_DIR%"


:: remove all of the now empty subdirectories.
for /d %%i in ("%PARENT_DIR%"\*) do @rmdir /s /q "%%i"



PAUSE
CLS
echo restarting ..
goto start