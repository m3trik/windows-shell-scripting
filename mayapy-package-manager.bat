@ECHO off
:: pip needs to already have been installed to mayapy.
:: the following commands are for a windows environment.

:: Admin check
rem fltmc >nul 2>nul || set _=^"set _ELEV=1^& cd /d """%cd%"""^& "%~f0" %* ^"&&((if "%_ELEV%"=="" ((powershell -nop -c start cmd -args '/d/x/s/v:off/r',$env:_ -verb runas >nul 2>nul) || (mshta vbscript:execute^("createobject(""shell.application"").shellexecute(""cmd"",""/d/x/s/v:off/r ""&createobject(""WScript.Shell"").Environment(""PROCESS"")(""_""),,""runas"",1)(window.close)"^) >nul 2>nul)))& exit /b)


:intro
color 07
set ver=0.5.0
ECHO Welcome to Maya Python Package Manager v%ver%
ECHO\


:setVersion
ECHO What is your Maya version? (ex. 2022)
set /p maya_version=
set mayapy="%ProgramFiles%\Autodesk\Maya%maya_version%\bin\mayapy.exe"
echo %mayapy%


:main
ECHO\
ECHO What do you want to do?
ECHO	1- Install package
ECHO	2- Uninstall package
ECHO	3- List installed packages
ECHO	4- Update existing packages
ECHO	5- Get package info
ECHO	6- Backup
ECHO	7- Restore

CHOICE /C:1234567

IF ERRORLEVEL 7 goto restore
IF ERRORLEVEL 6 goto backup
IF ERRORLEVEL 5 goto info
IF ERRORLEVEL 4 goto update
IF ERRORLEVEL 3 goto list
IF ERRORLEVEL 2 goto uninstall
IF ERRORLEVEL 1 goto install


:install
ECHO\
ECHO What is the name of the package you want to INSTALL?
set /p module=
ECHO\
%mayapy% -m pip install %module%
goto main


:uninstall
ECHO\
ECHO What is the name of the package you want to UNINSTALL?
set /p module=
ECHO\
%mayapy% -m pip uninstall %module% -y
goto main


:list
ECHO\
%mayapy% -m pip list
goto main


:update
ECHO\
ECHO Which package do you want to UPDATE?
rem ECHO `all` will attempt to update all packages
rem ECHO `pip` will update the package installer
rem ECHO or give the name of a specific package:
set /p module=
ECHO\
if "%module%"=="all" (
:: update all on windows:
%mayapy% -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
:: update all on unix:
rem %mayapy% -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
) else if "%module%"=="pip" (
%mayapy% -m pip install --upgrade pip
) else (
%mayapy% -m pip install %module% --upgrade
)
goto main


:info
ECHO\
ECHO Which specific package do you want info on?
set /p module=
ECHO\
%mayapy% -m pip show %module%
goto main


:backup
ECHO\
ECHO This operation will create a requirements file, which lists all the Python packages and their versions that are currently installed in your system. This file can be used later to recreate the same environment, including the same versions of packages.
ECHO\
%mayapy% -m pip freeze > requirements.txt
ECHO The backup file `requirements.txt` was saved in the location of this script. (%cd%)
goto main


:restore
ECHO\
%mayapy% -m pip install -r requirements.txt
goto main