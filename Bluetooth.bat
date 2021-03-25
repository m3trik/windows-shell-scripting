@echo off

for /F "tokens=3 delims=: " %%H in ('sc query "bthserv" ^| findstr "STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start "bthserv"
  ) else if /I "%%H" NEQ "STOPPED" (
   net stop "bthserv"
  )
)