@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

REM This is just a characther encoding. Remove or change according to your encoding.
CHCP 1252

CLS

SET COUNTERA=0
SET COUNTERB=0
REM This sets the path to where the files for renaming are places. Currently it is set to "current path".
SET mypath=%cd%

ECHO.
ECHO.
ECHO "      ____                                     _______ __           "
ECHO "     / __ \___  ____  ____ _____ ___  ___     / ____(_) /__  _____  "
ECHO "    / /_/ / _ \/ __ \/ __ `/ __ `__ \/ _ \   / /_  / / / _ \/ ___/  "
ECHO "   / _, _/  __/ / / / /_/ / / / / / /  __/  / __/ / / /  __(__  )   "
ECHO "  /_/ |_|\___/_/ /_/\__,_/_/ /_/ /_/\___/  /_/   /_/_/\___/____/    "
ECHO "                                                                    "
ECHO "                                                                    "           
ECHO.
ECHO    (C) 2016 ThomasTJ (TTJ)
ECHO.
ECHO.
ECHO   This script checks if char exists in filename 
ECHO   and replaces that char.
ECHO.
ECHO   The files needs to be in %mypath%
ECHO.
ECHO   Renamed files will be shown in the file "RenamedFiles.txt"
ECHO.
ECHO.

pause

ECHO.
ECHO   [*] Controlling folder: %mypath%
ECHO.
ECHO   [*] Starting check:
ECHO.

REM Looping through folder
for /f "delims=" %%i in ('dir /b *') do (

    SET str=%%i

    REM Replace statements:
    SET str=!str:+©=A!
    SET str=!str:+ÿ=d!
    SET str=!str:+ª=C!
    SET str=!str:W=!
   
    REM Check if it's checking the batch scripts filename, then ignore
    IF "%%i" == "%~n0%~x0" (
        SET str=%%i
    ) ELSE (
        IF "%%i" == "!str!" (
            REM Filename does NOT include replacing chars
            set /A COUNTERB=COUNTERB+1
            ECHO     [+]  !str!
        ) ELSE (
            REM Filename does include replacing chars
            set /A COUNTERA=COUNTERA+1
            ECHO Ori: %%i   "-->"   New: !str! >> "RenamedFiles.txt"
            ECHO     [-]  %%i
            REN "%%i" "!str!"
        )
    )
)

ECHO.
ECHO.
ECHO.
ECHO   Done:
ECHO.
ECHO     [+]  Not changed       : %COUNTERB%
ECHO     [-]  Changed files     : %COUNTERA%
ECHO     [-]  Registered in     : "RenamedFiles.txt"
ECHO.
ECHO.
ECHO.

PAUSE>NUL
GOTO :EXIT

:EXIT
