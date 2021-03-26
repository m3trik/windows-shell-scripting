@ECHO OFF
:: pip installs a given module to 3dsmaxpy.
:: pip needs to already have been installed to 3dsmaxpy.

:: globals
ECHO Give the name of the module to install:
set /p MODULE=
ECHO/
ECHO Verify the path to mayapy.exe and hit enter to install:
set /p PYTHON_PATH="C:/Program Files/Autodesk/3ds Max 2020/3dsmax.exe"


%PYTHON_PATH% pip install %MODULE%

PAUSE
EXIT