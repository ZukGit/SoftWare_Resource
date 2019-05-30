@ECHO off

Setlocal enabledelayedexpansion
cd !cd!

ECHO initialize
:LOOP

ECHO waiting device in USB
adb wait-for-device

FOR %%i IN (*.apk) DO ( 
 	ECHO install-package: %%i
 	adb install "%%i"
 	)

ECHO install-all-apk-success change other device to USB
PAUSE
GOTO LOOP

@ECHO on