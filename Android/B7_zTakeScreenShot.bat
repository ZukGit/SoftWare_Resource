@ECHO off

@REM 将adb.exe添加到PATH中
ECHO 初始化…
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM 无限循环的标签
:LOOP

ECHO 等待您插入手机…
adb wait-for-device

@rem adb shell pm list packages -3 > ./B7_uninstallpacket.txt

set hh=%time:~0,2%
if /i %hh% LSS 10 (set hh=0%time:~1,1%)

set CURRENT_DATE_TIME_STAMP=%date:~0,4%%date:~5,2%%date:~8,2%_%hh%%time:~3,2%%time:~6,2%


adb shell screencap -p /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png

ECHO 截图名称/sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png 
@rem 截图名称/sdcard/Pictures/B7_zscreenshot_20190511_ 80010.png

adb pull /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png  ./B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png

ECHO   结束！
PAUSE
GOTO LOOP
@ECHO on