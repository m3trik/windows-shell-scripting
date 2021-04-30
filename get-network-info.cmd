@echo off

ECHO/
ECHO _____ MAC ADDRESS __________

getmac


ECHO/
ECHO _____ NETWORK ADDRESS ______
ECHO/

ipconfig | findstr IPv4

ipconfig | findstr IPv6

ECHO/
ECHO _____ DEFAULT GATEWAY ______
ECHO/

ipconfig | findstr /i "Gateway"
ECHO    *see below for ip

ECHO/
ECHO ____________________________
ipconfig /all


PAUSE