@echo off

REM find OS type and version of system
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
Pause