:: ------------------------------------------------------------------------
:: This script will get rid of any subfolders while keeping their contents.
:: ------------------------------------------------------------------------

CLS
goto setPath


:: set variables
:setPath
set /p PARENT_DIR=Parent dir ?
set "MOVETO_DIR=%PARENT_DIR%"
:: Set filetype. (*) all filetypes. (*.ext) explicit.
set FILETYPE=*



:: move files in subfolders to top level.
for /r "%PARENT_DIR%" %%i in (%FILETYPE%) do @move "%%i" "%MOVETO_DIR%"


:: remove all of the now empty subdirectories.
for /d %%i in ("%PARENT_DIR%"\*) do @rmdir /s /q "%%i"


goto setPath