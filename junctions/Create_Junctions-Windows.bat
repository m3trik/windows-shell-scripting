@ECHO OFF
REM Create or remove window directory junctions.
goto main




:main
ECHO/
ECHO Create or remove Junction for:
ECHO/
ECHO	1- User Specified Dir
ECHO	2- Links
ECHO	3- Start Menu
ECHO	4- Downloads
ECHO	5- Exit

CHOICE /C:12345

IF ERRORLEVEL 5 goto exit_
IF ERRORLEVEL 4 goto downloads
IF ERRORLEVEL 3 goto startmenu
IF ERRORLEVEL 2 goto links
IF ERRORLEVEL 1 goto makedir




:makedir
ECHO/
ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto userremove
IF ERRORLEVEL 1 goto userset

goto main




:userset
ECHO/
set /p source=original folder location?
set /p destination=destination directory? 
goto create


:userremove
ECHO/
set /p destination=destination directory? 
goto remove


:userset_dir
ECHO/
set /p destination=destination directory?
goto create




:links
ECHO/
echo links
set source=%USERPROFILE%\Favorites\Links
set destination=%CLOUD%\Windows\_symlinks\Links

ECHO	1- Create Junction at %source% to %destination%.
ECHO	2- Delete Junction at %source%.
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:startmenu
ECHO/
echo start menu
set source=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu
rem set source=%USERPROFILE%\Desktop\new folder
set destination=%CLOUD%\Windows\_symlinks\Start Menu

ECHO	1- Create Junction at %source% to %destination%.
ECHO	2- Delete Junction at %source%.
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:downloads
ECHO/
echo downloads
set source=%USERPROFILE%\downloads
set destination=%CLOUD%\Downloads

ECHO	1- Create Junction at %source% to %destination%.
ECHO	2- Delete Junction at %source%.
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create




:create
ECHO/
ECHO Creating link at %source% to %destination% ..

mklink /J "%source%" "%destination%"

goto main




:remove
ECHO/
ECHO Removing link at: %source% ..

RMDIR "%source%"

goto main




:exit_
CLS
EXIT