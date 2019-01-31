@ECHO OFF
CLS
REM Create or remove native windows os folder junctions.



ECHO	1- User Specified Dir
ECHO	2- Shortcuts (links)
ECHO	3- Cloud Dir
ECHO	4- Exit

CHOICE /C:1234

IF ERRORLEVEL 4 goto exit
IF ERRORLEVEL 3 goto cloud
IF ERRORLEVEL 2 goto shortcuts
IF ERRORLEVEL 1 goto makedir


:makedir
cls

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 set /p junction=junction folder location: && goto remove
IF ERRORLEVEL 1 set /p source=original folder location: && set /p junction=junction folder location: && goto create

PAUSE
EXIT

:shortcuts
cls
echo shortcuts dir
set source=%USERPROFILE%\Favorites\Links
set junction=%CLOUD%\Windows\shortcuts\Favorites\Links

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create

:cloud
cls
echo cloud dir
set source=%USERPROFILE%\Google Drive
set junction=%CLOUD%

ECHO	1- Create Junction
ECHO	2- Delete Junction
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create



:create
set flags=[-J]
set junction="%junction% %flags%"
mklink /J "%source%"	%junction%

PAUSE
EXIT


:remove
set flags=[-J]
set junction="%junction% %flags%"
RMDIR %junction%

PAUSE
EXIT

:exit
CLS