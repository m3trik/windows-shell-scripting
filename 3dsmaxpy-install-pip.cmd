@ECHO OFF
:: installs pip to 3dsmaxpy.
:: dependancies: get-pip.py

:: globals
ECHO Verify the location of the 'get-pip.py' module:
set /p _MODULE="O:\Cloud\Code\Windows\Shell\_scripts\3rd party dependancies\get-pip.py"
ECHO/
ECHO Verify the path to 3dsmaxpy.exe and hit enter to install:
set /p _PYTHON="C:\Program Files\Autodesk\3ds Max 2020\3dsmaxpy.exe"


%_PYTHON% %_MODULE%
%_PYTHON% pip install --upgrade pip

PAUSE