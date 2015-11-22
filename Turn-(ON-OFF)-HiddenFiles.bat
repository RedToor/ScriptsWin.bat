REM Turn-(ON-OFF)-HiddenFiles
REM Script by Redtoor
echo off
cls
REG QUERY HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden | find "Hidden" > log.log
for /f "tokens=3" %%v in (log.log) do set val=%%v & del log.log
if %val%==0x2 (reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 0x00000001 /f) 
if %val%==0x1 (reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 0x00000002 /f) 
