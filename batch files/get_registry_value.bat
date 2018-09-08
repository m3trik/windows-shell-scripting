@ECHO OFF
CLS

rem get registry value, specifying path and key



SET /p regPath=Registry path?
SET /p regKey=key?

for /f "tokens=3" %%a in ('reg query regPath /V Background  ^|findstr /ri regKey') do echo %%a


PAUSE