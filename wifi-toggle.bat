@Echo off 

REM         Must be run as administrator.

set interface="Wi-Fi"
ipconfig | find %interface% >NUL
rem if errorlevel 0 goto Disable
rem if errorlevel 1 goto Enable
if %errorlevel% EQU 0 goto Disable
if %errorlevel% EQU 1 goto Enable

:Disable
echo "Disabling Wi-Fi"
netsh interface set interface %interface% disabled
goto end

:Enable
echo "Enabling Wi-Fi"
netsh interface set interface %interface% enabled
:end