REM 21/11/2015, 8:31pm
REM RedToor
REM USBFixer - FAT, FAT32

echo off > null
cls
title USBFixer - Repair USB
echo.
echo  USBFixer Script Bat
echo.
echo list volume > %temp%\tempFile1.USBfixer
diskpart /s %temp%\tempFile1.USBfixer
echo.
set /p device= "#Write the number of Device to repair:"
echo.
echo #Fixing...
(
echo select volume %device%
echo clean
echo create partition primary
echo select partition 1 
echo active 
echo format fs=FAT quick 
echo exit 
)>%temp%\tempFile2.USBfixer
diskpart /s %temp%\tempFile2.USBfixer > null
if %errorlevel% == 0 echo #Device Fixed.
if %errorlevel% == 1 echo #Error.
del /f /s %temp%\tempFile1.USBfixer > null
del /f /s %temp%\tempFile2.USBfixer > null
pause>null
