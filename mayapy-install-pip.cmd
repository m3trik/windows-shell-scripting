@ECHO OFF
:: installs pip to mayapy.
:: dependancies: get-pip.py

:: globals
rem ECHO Verify the location of the 'get-pip.py' module:
set get_pip="3rd party dependancies\get-pip.py"
ECHO/
rem ECHO Verify the path to mayapy.exe and hit enter to install:
ECHO Maya version?  (ex. 2022)
set /P maya_version=
set mayapy="%PROGRAMFILES%\Autodesk\Maya%maya_version%\bin\mayapy.exe"



:: install or upgrade pip.
ECHO/
%mayapy% %get_pip%
%mayapy% pip install --upgrade pip



PAUSE