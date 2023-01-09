@ECHO OFF
:: pip installs a given module to 3dsmaxpy.
:: pip needs to already have been installed to 3dsmaxpy.

:: globals
ECHO Give the name of the module to install:
set /p _MODULE=
ECHO/
ECHO Verify the path to 3dsmaxpy.exe and hit enter to install:
set /p _VER=3ds Max version? (ex. 2022)
set _PYTHON="C:\Program Files\Autodesk\3ds Max %_VER%\3dsmaxpy.exe"
echo %_PYTHON%

%_PYTHON% -m pip install %_MODULE%

PAUSE