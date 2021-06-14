@echo OFF
CLS
echo.
goto main

:: This script queries various disk drive information for the current system.


:main
@title wmic disk query
@echo 1. Name
@echo 2. SystemName
@echo 3. Manufacturer
@echo 4. Model
@echo 5. DeviceID
@echo 6. InterfaceType
@echo 7. MediaType
@echo 8. Size
@echo 9. SerialNumber
@echo 10. Partitions
rem @echo │11.
rem @echo │12.
rem @echo │13.
rem @echo │14.
rem @echo │15.
rem @echo │16.
rem @echo │17.

:choice
@set /p userinp=Type the number of your choice:
::userinp: request 2 characters starting from the 0th character.
@set userinp=%userinp:~0,2%
@if "%userinp%"=="1" set N=Name
@if "%userinp%"=="2" set N=SystemName
@if "%userinp%"=="3" set N=Manufacturer
@if "%userinp%"=="4" set N=Model
@if "%userinp%"=="5" set N=DeviceID
@if "%userinp%"=="6" set N=InterfaceType
@if "%userinp%"=="7" set N=MediaType
@if "%userinp%"=="8" set N=Size
@if "%userinp%"=="9" set N=SerialNumber
@if "%userinp%"=="10" set N=Partitions
rem @if "%userinp%"=="11" set N=
rem @if "%userinp%"=="12" set N=
rem @if "%userinp%"=="13" set N=
rem @if "%userinp%"=="14" set N=
rem @if "%userinp%"=="15" set N=
rem @if "%userinp%"=="16" set N=
rem @if "%userinp%"=="17" set N=



wmic diskdrive get %N%
goto choice



rem ------------------------------------------------------------------------------
rem The full list of properties that you can use for the query above is as follows:

rem Availability
rem BytesPerSector
rem Capabilities
rem CapabilityDescriptions
rem Caption
rem CompressionMethod
rem ConfigManagerErrorCode
rem ConfigManagerUserConfig
rem CreationClassName
rem DefaultBlockSize
rem Description
rem DeviceID
rem ErrorCleared
rem ErrorDescription
rem ErrorMethodology
rem FirmwareRevision
rem Index
rem InstallDate
rem InterfaceType
rem LastErrorCode
rem Manufacturer
rem MaxBlockSize
rem MaxMediaSize
rem MediaLoaded
rem MediaType
rem MinBlockSize
rem Model
rem Name
rem NeedsCleaning
rem NumberOfMediaSupported
rem Partitions
rem PNPDeviceID
rem PowerManagementCapabilities
rem PowerManagementSupported
rem SCSIBus
rem SCSILogicalUnit
rem SCSIPort
rem SCSITargetId
rem SectorsPerTrack
rem SerialNumber
rem Signature
rem Size
rem Status
rem StatusInfo
rem SystemCreationClassName
rem SystemName
rem TotalCylinders
rem TotalHeads
rem TotalSectors
rem TotalTracks
rem TracksPerCylinder