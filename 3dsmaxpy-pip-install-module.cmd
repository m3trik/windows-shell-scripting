@ECHO OFF
:: pip installs a given module to 3dsmaxpy.
:: pip needs to already have been installed to 3dsmaxpy.

:: globals
ECHO Give the name of the module to install:
set /p _MODULE=
ECHO/
ECHO Verify the path to mayapy.exe and hit enter to install:
set /p _PYTHON="C:/Program Files/Autodesk/3ds Max 2020/3dsmaxpy.exe"


%_PYTHON% -m pip install %_MODULE%

PAUSE