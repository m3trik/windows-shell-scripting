@ECHO OFF
REM Create or remove window directory junctions.
goto main



:main
CLS
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
cls

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto userremove
IF ERRORLEVEL 1 goto userset
PAUSE
EXIT



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
cls
echo links
set source=%USERPROFILE%\Favorites\Links
set destination=%CLOUD%\Windows\shortcuts\Links [-j]

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create



:startmenu
cls
echo start menu
set source=%USERPROFILE%\AppData\Roaming\Microsoft\Windows
rem set source=%USERPROFILE%\Desktop\new folder
set destination=%CLOUD%\Windows\shortcuts\Start Menu [-j]

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create



:downloads
cls
echo downloads
set source=%USERPROFILE%\downloads
set destination=%STORAGE%\_Download

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Back to Main Menu

CHOICE /C:123

IF ERRORLEVEL 3 goto main
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create



:create
ECHO/
echo %source%
echo %destination%

ECHO	1- Continue
ECHO	2- Change Destination Directory

CHOICE /C:12

IF ERRORLEVEL 2 mklink /J goto userset_dir
IF ERRORLEVEL 1 mklink /J "%source%" "%destination%"

PAUSE
goto main




:remove
RMDIR "%source%"

PAUSE
goto main



:exit_
CLS