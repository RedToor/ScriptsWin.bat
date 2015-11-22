@echo off
MODE CON cols=56 lines=20
cls 
title MakeDisk
if exist Mk.dll (goto si) else (goto menu)
:si
del Mk.dll
goto menu
:menu
title MakeDisk
cls
echo. 
echo                  /--\     /--\
echo                 /..=\\   //=..\
echo                 L....\\ //....J
echo                 L..   \V/   ..J
echo                 L..    V    ..J 
echo                 L..         ..Make Disk
echo.
echo       MakeDisk, It Is for Create Virtual Disk VHD
echo                 Script Bat by RedToor.
echo.
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º1ºMake Diskº  º2º  Make Disk Pro  º  º3ºDelete Diskº 
echo  ÈÍÍÍÍÍÍÍÍÍÍÍ¼  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍ¼ 
echo. 
echo.
CHOICE /C:123 /m Option=
IF ERRORLEVEL 3 GOTO e
IF ERRORLEVEL 2 GOTO a
IF ERRORLEVEL 1 GOTO make
cls
:make
title MakeDisk / Make Disk
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º                    Make Disk                       º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
if exist %homedrive%\folderDisk (goto no) else (goto si)
:si
md %homedrive%\folderDisk > nul
:no
echo  Form. 
echo.
set /p tamallo=Size Disk in MB /1000 Mb = 1 Gb/  =
if %tamallo% LSS 0 exit
set /p letra=Letter Disk /T, H, U, O/          =
if %letra% LSS 0 exit
echo.
echo  ------------------------
echo  Size     = %tamallo%  
echo  Letter   = %letra%
echo  Format   = fat             ÉÍÍÍÍÍ»  ÉÍÍÍÍ»
echo  Disk     = expandable      º1ºYesº  º2ºNoº
echo  Partition= primaria        ÈÍÍÍÍÍ¼  ÈÍÍÍÍ¼
echo  ------------------------
echo.
CHOICE /C:12 /m Sure=
IF ERRORLEVEL 2 GOTO make
IF ERRORLEVEL 1 GOTO yes

:yes
set prop=Make Disk
title MakeDisk / Wait.
cls
echo.
echo.
echo.
echo. 
echo                  /--\     /--\
echo                 /..=\\   //=..\
echo                 L....\\ //....J
echo                 L..   \V/   ..J
echo                 L..    V    ..J 
echo                 L..         ..Make Disk
echo.
echo.
echo                   Please Wait a While
echo                       Procesing...
echo create vdisk file=%homedrive%\folderDisk\Disco%letra%.vhd maximum=%tamallo% type=expandable >> Mk.dll
echo select vdisk file=%homedrive%\folderDisk\Disco%letra%.vhd >> Mk.dll
echo attach vdisk >> Mk.dll
echo create partition primary >> Mk.dll
echo format fs=fat quick >> Mk.dll
echo assign letter=%letra%: >> Mk.dll
echo list volume >> Mk.dll
diskpart /s .\Mk.dll > nul
if %errorlevel%==0 goto done
if %errorlevel% NEQ 0 goto error
:done
echo %prop% >> %homedrive%\folderDisk\logs.log
echo started MakeDisk In /%cd%/ to %time% - %date% and ended in %time% - %date% >> %homedrive%\folderDisk\logs.log
echo date   = %tamallo%mb >> %homedrive%\folderDisk\logs.log
echo letter = %letra% %volume% >> %homedrive%\folderDisk\logs.log
echo ============================================================================================================== >> %homedrive%\folderDisk\logs.log
del Mk.dll > nul 
title MakeDisk / Done.
cls
echo.
echo. 
echo.
echo.
echo                  /--\     /--\
echo                 /..=\\   //=..\
echo                 L....\\ //....J
echo                 L..   \V/   ..J
echo                 L..    V    ..J 
echo                 L..         ..Make Disk
echo.
echo.
echo                        Done.
pause>nul
goto Menu
:e
set prop=Delete
title MakeDisk / Delete.
echo.
cls
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º                       Delete                       º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p volume= Disk To Delete /T, H, U, O/  =
if %volume% LSS 0 exit
echo.
echo.
echo  ------------------------
echo                             ÉÍÍÍÍÍ»  ÉÍÍÍÍ»
echo  Disk     = %volume%               º1ºYesº  º2ºNoº
echo                             ÈÍÍÍÍÍ¼  ÈÍÍÍÍ¼
echo  ------------------------
echo.
echo.
echo.
CHOICE /C:12 /m Sure=
IF ERRORLEVEL 2 GOTO e
IF ERRORLEVEL 1 GOTO yes2

:yes2
cls
echo.
echo. 
echo.
echo. 
echo                  /--\     /--\
echo                 /..=\\   //=..\
echo                 L....\\ //....J
echo                 L..   \V/   ..J
echo                 L..    V    ..J 
echo                 L..         ..Make Disk
echo.
echo.
echo                   Please Wait a While
echo                       Procesing...
echo sel vdisk file="%homedrive%\folderDisk\Disco%volume%.vhd" >> Mk.dll
echo detach vdisk >> Mk.dll
diskpart /s .\Mk.dll > nul
if %errorlevel%==0 goto done2
if %errorlevel% NEQ 0 goto error
:done2
del nul
del Mk.dll
del %homedrive%\folderDisk\Disco%volume%.vhd"
goto done
:a
title Make Disk Pro
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º                   Make Disk Pro                    º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
if exist %homedrive%\folderDisk (goto no) else (goto si)
:si
md %homedrive%\folderDisk > nul
:no
echo  Form. 
echo.
set /p tamallo= Size Disk in MB /1000 Mb = 1 Gb/  =
if %tamallo% LSS 0 exit
set /p letra= Letter Disk /T, H, U, O/          =
if %letra% LSS 0 exit
set /p formato= Format /ntfs, fat, fat32/         =
if %formato%==ntfs  (goto con) 
if %formato%==fat   (goto con) 
if %formato%==fat32 (goto con) else (goto error)
:con
set /p tipo= Typo /expandable,  fixed/         =
if %tipo%==expandable  (goto con2)  
if %tipo%==fixed       (goto con2) else (goto error)
:con2
set /p name= Name                              =
cls
echo.
echo.
echo.
echo  ------------------------
echo  Size     = %tamallo%  
echo  Letter   = %letra%
echo  Type     = %tipo%
echo  Name     = %name%
echo  Format   = %formato%                  
echo  Partition= primaria       
echo  ------------------------
echo.
echo                     ÉÍÍÍÍÍ»  ÉÍÍÍÍ»
echo                     º1ºYesº  º2ºNoº
echo                     ÈÍÍÍÍÍ¼  ÈÍÍÍÍ¼
echo.
CHOICE /C:12 /m Sure=
IF ERRORLEVEL 2 GOTO a
IF ERRORLEVEL 1 GOTO yes2

:yes2
set prop=Make Disk
title MakeDisk / Wait.
cls
echo.
echo. 
echo.
echo. 
echo                  /--\     /--\
echo                 /..=\\   //=..\
echo                 L....\\ //....J
echo                 L..   \V/   ..J
echo                 L..    V    ..J 
echo                 L..         ..Make Disk
echo.
echo.
echo                   Please Wait a While
echo                       Procesing...
echo create vdisk file=%homedrive%\folderDisk\Disco%letra%.vhd maximum=%tamallo% type=expandable >> Mk.dll
echo select vdisk file=%homedrive%\folderDisk\Disco%letra%.vhd >> Mk.dll
echo attach vdisk >> Mk.dll
echo create partition primary >> Mk.dll
echo format fs=%formato% quick >> Mk.dll
echo assign letter=%letra%: >> Mk.dll
echo list volume >> Mk.dll
diskpart /s .\Mk.dll > nul
label %letra%: %name% 
if %errorlevel%==0 goto done
if %errorlevel% NEQ 0 goto error
//Error
:error
del Mk.dll
title MakeDisk / Error.
cls
echo.
echo. 
echo.
echo.
echo                  /--\     /--\
echo                 /..=\\   //=..\
echo                 L....\\ //....J
echo                 L..   \V/   ..J
echo                 L..    V    ..J 
echo                 L..         ..Make Disk
echo.
echo.
echo                        Error.
pause>nul
goto Menu


