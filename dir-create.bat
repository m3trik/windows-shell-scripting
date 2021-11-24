@echo OFF
cls



::set path to current file location
set "path_=%~dp0"
::Does string have a trailing slash? if so remove it 
if %path_:~-1%==\ SET path_=%path_:~0,-1%





:main-menu
cls
echo path: %path_%
echo.
echo.
echo.
echo	1- Create New Directory
echo	2- Change Path
echo	3- Exit

choice /C:123

if errorlevel 3 goto exit
if errorlevel 2 goto setPath
if errorlevel 1 goto create





:setPath
set /P path_=enter new path: 
if not exist %path_% (
	echo.
	echo cannot find: %path_%
	echo.
	goto setPath
)
else(
	goto create
)



:create
cls
echo path: %path_%
echo.
echo.
echo.
set /p dirName=new directory name?
set "fullPath=%path_%\%dirName%"
echo.
echo attempting to create %fullPath%...
echo.
if exist %fullPath% (
	echo "...directory already exists."
	echo.
) else (
	mkdir %fullPath%
	echo.
	echo "...directory created."
	echo.
)

pause







:exit
EXIT