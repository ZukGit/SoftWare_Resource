@ECHO off
Setlocal ENABLEDELAYEDEXPANSION
ECHO initialize-ing
:LOOP

adb wait-for-device

set hh=%time:~0,2%
if /i %hh% LSS 10 (set hh=0%time:~1,1%)

set CURRENT_DATE_TIME_STAMP=%date:~0,4%%date:~5,2%%date:~8,2%_%hh%%time:~3,2%%time:~6,2%


adb shell screencap -p /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png

ECHO Picture_Name: /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png 

adb pull /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png  ./B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png

ECHO   END
PAUSE
GOTO LOOP
@ECHO on