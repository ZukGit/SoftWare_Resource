@ECHO off

@REM ��adb.exe��ӵ�PATH��
ECHO ��ʼ����
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM ����ѭ���ı�ǩ
:LOOP

ECHO �ȴ��������ֻ���
adb wait-for-device

@rem adb shell pm list packages -3 > ./B7_uninstallpacket.txt

set hh=%time:~0,2%
if /i %hh% LSS 10 (set hh=0%time:~1,1%)

set CURRENT_DATE_TIME_STAMP=%date:~0,4%%date:~5,2%%date:~8,2%_%hh%%time:~3,2%%time:~6,2%


adb shell screencap -p /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png

ECHO ��ͼ����/sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png 
@rem ��ͼ����/sdcard/Pictures/B7_zscreenshot_20190511_ 80010.png

adb pull /sdcard/Pictures/B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png  ./B7_zscreenshot_%CURRENT_DATE_TIME_STAMP%.png

ECHO   ������
PAUSE
GOTO LOOP
@ECHO on