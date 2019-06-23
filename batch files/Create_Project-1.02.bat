@echo OFF
cls


rem preset variables
:variables
rem # set new or existing project name:
set "projectName="
set "projectSuffix=.proj"
rem # set subfolder prefix
set "subFolderPrefix=%projectName%"

rem set initial folder location
rem set "folderLocation=%~dp0"  <use this instead of line below to default to batch file dir location.
set "folderLocation=%CLOUD%\__Graphics\___projects"
rem strip any trailing '\'
if %folderLocation:~-1%==\ SET folderLocation=%folderLocation:~0,-1%

rem do not modify below this line.
set "directory=%folderLocation%\%projectName%%projectSuffix%"

goto main-menu


rem user defined variables
:setProjectName
SET /P projectName=Enter project name:
set projectSuffix=
rem # set subfolder prefix
set "subFolderPrefix=%projectName%"
set "directory=%folderLocation%\%projectName%%projectSuffix%"
goto create-menu

:setDir
set /P folderLocation=enter new directory: 
if not exist %folderLocation% (
	echo.
	echo cannot find: %folderLocation%
	echo.
	goto setDir
) else (
	goto main-menu
)


:main-menu
cls
echo directory: %folderLocation%
echo:
echo:
echo:
echo	1- Create New Project
echo	2- Change Working Directory
echo	3- Exit

choice /C:123

if errorlevel 3 goto exit
if errorlevel 2 goto setDir
if errorlevel 1 goto setProjectName


:create-menu
cls
echo:
echo	1- Create %folderLocation%\%projectName%?
echo	2- Change project name
echo	3- Back
echo	4- Exit

choice /C:1234

if errorlevel 4 goto exit
if errorlevel 3 goto main-menu
if errorlevel 2 goto setProjectName
if errorlevel 1 goto create



:create
cls
echo checking to see if %directory% exists...

if exist %directory% ^
echo "...project already exists."

if not exist %directory% ^
mkdir %directory% &^
echo "...project created."
echo:



echo "checking for the existence of subdirectories..."
echo:



set "folderName=.images"
mkdir %directory%\%folderName% &^
mkdir %directory%\%folderName%\.reference_images &^
mkdir %directory%\%folderName%\.render &^
echo %folderName% and all subdirectories; created.
echo:



set "folderName=.textures"
mkdir %directory%\%folderName% &^
mkdir %directory%\%folderName%\.maps &^
mkdir %directory%\%folderName%\.uv &^
echo %folderName% and all subdirectories; created.
echo:



set "folderName=.animation"
mkdir %directory%\%folderName% &^
mkdir %directory%\%folderName%\.frames &^
echo %folderName% and all subdirectories; created.
echo:



set "folderName=.audio"
mkdir %directory%\%folderName% &^
echo %folderName% and all subdirectories; created.
echo:



set "folderName=.scenes"
mkdir %directory%\%folderName% &^
mkdir %directory%\%folderName%\.assets &^
echo %folderName% and all subdirectories; created.
echo:



set "folderName=.scripts"
mkdir %directory%\%folderName% &^
echo %folderName% and all subdirectories; created.
echo:






pause
exit







:exit
EXIT