@if (@X)==(@Y) @end /* JScript comment
@echo off


:: C:\Program Files\Autodesk\Maya2018\bin\mayapy.exe needs to be added to PATH environment variable.
:: The initialize routine takes only one parameter (name), and it is optional. The name parameter tells Maya what the name of the application is. The default value for name is python.


set /p script= script:
mayapy.exe %script%


PAUSE