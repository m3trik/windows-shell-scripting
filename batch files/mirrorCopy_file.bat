@ECHO ON
SETLOCAL

SET SRC="%Cloud%\____Graphics\Maya\Scripts\_Python\_Python_startup"
SET DEST="%Cloud%\____Graphics\3ds Max\Scripts\_Python\___Python_path"
SET FName=tk.main.*
SET LOG="%Cloud%\____Graphics\3ds Max\Scripts\_Python\___Python_path"

:: IF NOT EXIST "%DEST%" MD "%DEST%"
:: IF NOT EXIST "%LOG%" MD "%LOG%"

SET OPT=/PURGE /S /NP /R:5 /LOG+:%Log% /TS /FP
rem SET CMD=robocopy %SRC% %FName% %DEST% %OPT%
SET CMD=ROBOCOPY "%SRC%" "%DEST%" *.* /PURGE /S /NP /ZB /R:5
%CMD%




:: /S         :: copy Subdirectories, but not empty ones.
:: /PURGE     :: delete dest files/dirs that no longer exist in source.
:: /NP        :: No Progress - don't display % copied.
:: /ZB        :: use restartable mode; if access denied use Backup mode.
:: /R:n       :: number of Retries on failed copies: default 1 million.

:: /LOG+:file :: output status to LOG file (append to existing log).
:: /TS        :: include source file Time Stamps in the output.
:: /FP        :: include Full Pathname of files in the output.


:: /MIR parameter of RoboCopy mirrors the directory structure exactly.
:: robocopy "c:\users\johndoe\desktop\test" "d:\test" Bookmarks.* /mir
:: This copies files named Bookmarks (with any extension) recursively, maintaining the same
:: directory structure in the destination..