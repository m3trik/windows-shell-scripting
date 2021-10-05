@ECHO OFF
:: pip installs a given module to mayapy.
:: pip needs to already have been installed to mayapy.

:: globals
ECHO Give the name of the module to install:
set /p MODULE=
ECHO/
ECHO Maya version? (ie. 2020):
set /p VERSION=
ECHO/
ECHO Verify the path to mayapy.exe and hit enter to install:
set /p MAYAPY_PATH="C:\Program Files\Autodesk\Maya%VERSION%\bin\mayapy.exe"


%MAYAPY_PATH% pip install %MODULE%

PAUSE
EXIT