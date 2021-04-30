@ECHO off



rem Disable BITS, Cryptographic, MSI Installer, and the Windows Update Services.

net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver


rem rename the SoftwareDistribution and Catroot2 folders.
ren C:\\Windows\\SoftwareDistribution SoftwareDistribution.old
ren C:\\Windows\\System32\\catroot2 Catroot2.old


rem enable BITS, Cryptographic, MSI Installer and the Windows Update Services.

net start wuauserv
net start cryptSvc
net start bits
net start msiserver



PAUSE