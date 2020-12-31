@ECHO OFF
:: installs pip to mayapy.
:: dependancies: get-pip.py

:: globals
ECHO Verify the location of get-pip.py (default: current dir):
set /p MODULE="get-pip.py"
ECHO/
ECHO Verify the path to mayapy.exe and hit enter to install:
set /p MAYAPY_PATH="C:\Program Files\Autodesk\Maya2020\bin\mayapy.exe"


%MAYAPY_PATH% %MODULE%

PAUSE
EXIT