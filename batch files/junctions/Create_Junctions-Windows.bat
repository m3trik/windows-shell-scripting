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
ECHO	4- Exit

CHOICE /C:1234

IF ERRORLEVEL 4 goto exit
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
set /p source=original folder location: 
set /p destination=destination folder location: 
goto create


:userremove
set /p destination=destination folder location: 
goto remove



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



:create
mklink /J "%source%"	"%destination%"

PAUSE
goto main



:remove
RMDIR "%destination%"

PAUSE
goto main



:exit
CLS