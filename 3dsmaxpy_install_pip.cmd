@ECHO OFF
:: installs pip to 3dsmaxpy.
:: dependancies: get-pip.py

:: globals
ECHO Verify the location of get-pip.py (default: current dir):
set /p MODULE="get-pip.py"
ECHO/
ECHO Verify the path to mayapy.exe and hit enter to install:
set /p PYTHON_PATH="C:/Program Files/Autodesk/3ds Max 2020/3dsmax.exe"


%PYTHON_PATH% %MODULE%

PAUSE
EXIT