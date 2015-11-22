@echo off
MODE CON cols=30 lines=10
title Remove4size 

REM --------------------------------------
set size= "here file size, example: (set size=196)"
REM --------------------------------------

:maiN
FOR %%A IN (A B C D E F G H I J K L M N Ñ O P V U Q R T W Z X V S Y) DO (	
	FOR %%B IN (%%A:\*.*) DO (
		if %%~zB EQU %size% (
			del /f %%~dpxnB
				  )))
echo.
echo.
echo   all right, it was nice.
echo   Date: 25/11/2014
echo   Coded by RedToor.
PAUSE > nul


