@ECHO off

@REM ��adb.exe��ӵ�PATH��
ECHO ��ʼ����
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM ����ѭ���ı�ǩ
:LOOP

ECHO �ȴ��������ֻ���
adb wait-for-device

adb shell pm list packages -3 > ./B7_uninstallpacket.txt
@REM ѭ����װ��Ŀ¼�µ�APK�ļ�
if exist B7_uninstallpacket.txt ( 
setlocal enabledelayedexpansion
@rem �����ļ����� 
  for /f %%l in (B7_uninstallpacket.txt) do ( 
       set /a num+=1 
	   set s=%%l
       set s=!s:~8!
@rem 	echo !s%! >> B7_test.txt
       ECHO ж�ذ�:  !s%!
       call adb uninstall !s%!
  )
ECHO �ֻ�����Ӧ������ȫж�أ�   
) else ( 
ECHO B7_uninstallpacket.txt�����ڣ� 
)

ECHO ж������APK���ˣ���һ̨�ֻ�ж�ذɣ�����
PAUSE
GOTO LOOP

@ECHO on