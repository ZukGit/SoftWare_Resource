@ECHO off
Setlocal ENABLEDELAYEDEXPANSION
@REM ��adb.exe��ӵ�PATH��
ECHO ��ʼ����
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM ����ѭ���ı�ǩ
:LOOP

ECHO �ȴ��������ֻ���
adb wait-for-device
adb shell pm list packages -3 -f > ./B7_autoBankupAPP.txt
@REM ѭ����װ��Ŀ¼�µ�APK�ļ�
:forbegin
if exist B7_autoBankupAPP.txt ( 
@rem �����ļ����� 
  for /f %%l in (B7_autoBankupAPP.txt) do (
set /a num+=1 
@rem set s=%%l
@rem echo "aaaa"
set mystr=%%l

@rem  echo "bbbbb1 = !mystr!"
@rem  echo "bbbbb2 = %mystr%"
set str=!mystr!
@rem  echo "ccccc = !str!"
::��"���滻�ɿո�
set "str=!str:"= !"
:lengthnext
if not "!str!"=="" (
 set /a numsize+=1
 set "str=!str:~1!"
 goto lengthnext
)
@rem   echo !mystr!�ַ�������Ϊ:%numsize%


set ch1=apk=
@rem  ע�⣬���������ִ�Сд�ģ�
set str2=!mystr!
@rem  �����ַ����������ض̣�����Ӱ��Դ�ַ���
:indexofnext
set prestr=!str2:~0,4! 
if not "!str2!"=="" (
set /a index+=1
if "!prestr!"=="%ch1% " goto last
@rem  �Ƚ����ַ��Ƿ�ΪҪ����ַ��������������ѭ��
set "str2=!str2:~1!"
goto indexofnext
)
set /a index=0
@rem  û���ҵ��ַ�ʱ����num����
:last
@rem  echo �ַ�'%ch1%'���ַ���"!mystr!"�е��״γ���λ��Ϊ%index%


@rem  ����82 , = ��λ����56
set /a pos = %index% -6
set apkpath=!mystr!
set apkpath=!mystr:~8,%pos%!
set packagename=!mystr!
set /a pos = %index% + 3
set packagename=!mystr:~%pos%,%numsize%!
@rem  echo ��װ·��Ϊ'!apkpath!'����Ϊ"!packagename!"
	   
@rem 	echo !s%! >> B7_test.txt
@rem        ECHO ж�ذ�:  !s%!
@rem        call adb uninstall !s%!
call adb pull !apkpath!  ./"!packagename!".apk

set /a index = 0
set /a pos = 0
set /a numsize = 0

more +1 B7_autoBankupAPP.txt > a.tmp
del B7_autoBankupAPP.txt
ren a.tmp B7_autoBankupAPP.txt

goto forbegin
)
ECHO �ֻ�����Ӧ��APK��������ȫ���ݵ����أ�   
) else (
ECHO B7_autoBankupAPP.txt�����ڣ� 
)

ECHO ��һ̨�ֻ���������APK�ɣ�����
PAUSE
GOTO LOOP

@ECHO on