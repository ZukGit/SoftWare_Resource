@ECHO off

@REM ��adb.exe��ӵ�PATH��
ECHO ��ʼ����
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM ����ѭ���ı�ǩ
:LOOP

ECHO �ȴ��������ֻ���
adb wait-for-device

@REM ѭ����װ��Ŀ¼�µ�APK�ļ�
FOR %%i IN (*.apk) DO ( 
 	ECHO ���ڰ�װ��%%i
 	adb install "%%i"
 	)

ECHO ��װ���ˣ���һ̨�ֻ��ɣ�����
PAUSE
GOTO LOOP

@ECHO on