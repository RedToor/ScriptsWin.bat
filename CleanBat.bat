REM Cleanbat
REM Script by RedToor

@echo off
@MODE CON cols=74 lines=20 
@setlocal EnableDelayedExpansion
@if exist "%HOMEDRIVE%\Users\%USERNAME%\bak" (cd /d "%HOMEDRIVE%\Users\%USERNAME%\bak" > nul) else (mkdir "%HOMEDRIVE%\Users\%USERNAME%\bak" > nul & cd /d "%HOMEDRIVE%\Users\%USERNAME%\bak" > nul)
cls
rem DIR ===================================================================================================
set dir1="%ProgramData%\Microsoft\Windows\WER\ReportArchive"
set dir2="%ProgramData%\Microsoft\Windows\WER\ReportQueue"
set dir3="%LOCALAPPDATA%\Microsoft\Windows\WER\ReportQueue"
set dir4="%HOMEDRIVE%\Windows\Prefetch"
set dir5="%HOMEDRIVE%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent"
set dir6="%HOMEDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History"
set dir7="%HOMEDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WER\ERC"
set dir8="%HOMEDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Temporary Internet Files"
set dir9="%HOMEDRIVE%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Network Shortcuts"
set dira="%HOMEDRIVE%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies"
set dirb="%HOMEDRIVE%\Users\%USERNAME%\AppData\Local\Diagnostics"
set dirc="%HOMEDRIVE%\Windows\Minidump"
set dird="%temp%"
set dire="%HOMEDRIVE%\MSOCache"
set dirf="%HOMEDRIVE%\Users\%username%\AppData\Roaming\Macromedia\Flash Player"
set dirg="%HOMEDRIVE%\ProgramData\Apple Computer\Installer Cache" 
set dirh="%HOMEDRIVE%\Users\%username%\AppData\Local\CrashDumps"
set diri="%HOMEDRIVE%\ProgramData\Installations"
rem =======================================================================================================
title 
for %%a in (txt,exe,img,lnk,tmp,size,file,od) do set %%a=0
set times=%time::=%
set times=%times:~0,6%
title Processing - Wait...
for %%a in (%dir1%,%dir2%,%dir3%,%dir4%,%dir5%,%dir6%,%dir7%,%dir8%,%dir9%,%dira%,%dirb%,%dirc%,%dird%,%dire%,%dirf%,%dirg%,%dirh%) do (
cd /d %%a
if !pro! EQU 0  set pros=[±±±            ]
set /a pro+=5
if !pro! EQU 10 set pros=[±±±±           ]
if !pro! EQU 15 set pros=[±±±±±          ]
if !pro! EQU 20 set pros=[±±±±±±         ]
if !pro! EQU 25 set pros=[±±±±±±±        ]
if !pro! EQU 30 set pros=[±±±±±±±±       ]
if !pro! EQU 35 set pros=[±±±±±±±±±      ]
if !pro! EQU 40 set pros=[±±±±±±±±±±     ]
if !pro! EQU 45 set pros=[±±±±±±±±±±±    ]
if !pro! EQU 50 set pros=[±±±±±±±±±±±±   ]
if !pro! EQU 55 set pros=[±±±±±±±±±±±±±  ]
if !pro! EQU 60 set pros=[±±±±±±±±±±±±±± ]
if !pro! EQU 65 set pros=[±±±±±±±±±±±±±±±]
for /r %%b in (*.*) do (
if /i %%~xb EQU .txt set /a txt+=1
if /i %%~xb EQU .log set /a txt+=1
if /i %%~xb EQU .ini set /a txt+=1
if /i %%~xb EQU .inf set /a txt+=1
if /i %%~xb EQU .xml set /a txt+=1
if /i %%~xb EQU .tmp set /a tmp+=1
if /i %%~xb EQU .exe set /a exe+=1
if /i %%~xb EQU .jpg set /a img+=1
if /i %%~xb EQU .png set /a img+=1
if /i %%~xb EQU .ico set /a img+=1
if /i %%~xb EQU .bmp set /a img+=1
if /i %%~xb EQU .gif set /a img+=1
if /i %%~xb EQU .dat set /a exe+=1
if /i %%~xb EQU .lnk set /a lnk+=1
set /a filec+=1
@del /f /q "%%b">nul
if %errorlevel% EQU 0 ( 
set /a file+=1
set /a size+=%%~za)
cls
)
cls
echo.
echo.
echo                        Progress !pros!
echo.
echo.
echo.
echo.
echo.
echo.
echo                              Wait, Please
echo  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ 
echo.
)
set timea=%time::=%
set timea=%timea:~0,6%
set /a timea="%timea%-%times%"
if %timea% GEQ 60 (set /a opa=%timea%/60 & set /a ope="%timea% %% 60") else (set "timea=%timea%'")
if %timea% GEQ 60 (set "timea=%opa%'' %ope%'")
set /a ft=%txt%+%exe%+%img%+%tmp%+%lnk%
set /a od=%file%-%ft%
cls
title Done, Script By RedToor
echo.
echo.
echo                        Progress %pros%
echo. 
echo.
echo.
echo.
echo                       Time         : %timea%      
echo                       Files        : %filec% files    
echo                       Files deleted: %file% files           
echo                       Size freed   : %size% kilobytes
echo.
echo.
echo                       Statistics text files :%txt%    
echo                                  exe  files :%exe%      
echo                                  img  files :%img% 
echo                                  tmp  files :%tmp%
echo                                  lnk  files :%lnk%
echo                                  other      :%od%
@pause>nul
