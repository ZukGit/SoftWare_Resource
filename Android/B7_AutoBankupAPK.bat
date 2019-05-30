@ECHO off
Setlocal ENABLEDELAYEDEXPANSION
@REM 将adb.exe添加到PATH中
ECHO 初始化…
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM 无限循环的标签
:LOOP

ECHO 等待您插入手机…
adb wait-for-device
adb shell pm list packages -3 -f > ./B7_autoBankupAPP.txt
@REM 循环安装本目录下的APK文件
:forbegin
if exist B7_autoBankupAPP.txt ( 
@rem 遍历文件多行 
  for /f %%l in (B7_autoBankupAPP.txt) do (
set /a num+=1 
@rem set s=%%l
@rem echo "aaaa"
set mystr=%%l

@rem  echo "bbbbb1 = !mystr!"
@rem  echo "bbbbb2 = %mystr%"
set str=!mystr!
@rem  echo "ccccc = !str!"
::将"号替换成空格
set "str=!str:"= !"
:lengthnext
if not "!str!"=="" (
 set /a numsize+=1
 set "str=!str:~1!"
 goto lengthnext
)
@rem   echo !mystr!字符串长度为:%numsize%


set ch1=apk=
@rem  注意，这里是区分大小写的！
set str2=!mystr!
@rem  复制字符串，用来截短，而不影响源字符串
:indexofnext
set prestr=!str2:~0,4! 
if not "!str2!"=="" (
set /a index+=1
if "!prestr!"=="%ch1% " goto last
@rem  比较首字符是否为要求的字符，如果是则跳出循环
set "str2=!str2:~1!"
goto indexofnext
)
set /a index=0
@rem  没有找到字符时，将num置零
:last
@rem  echo 字符'%ch1%'在字符串"!mystr!"中的首次出现位置为%index%


@rem  长度82 , = 的位置是56
set /a pos = %index% -6
set apkpath=!mystr!
set apkpath=!mystr:~8,%pos%!
set packagename=!mystr!
set /a pos = %index% + 3
set packagename=!mystr:~%pos%,%numsize%!
@rem  echo 安装路径为'!apkpath!'包名为"!packagename!"
	   
@rem 	echo !s%! >> B7_test.txt
@rem        ECHO 卸载包:  !s%!
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
ECHO 手机三方应用APK备份已完全备份到本地！   
) else (
ECHO B7_autoBankupAPP.txt不存在！ 
)

ECHO 换一台手机继续备份APK吧！！！
PAUSE
GOTO LOOP

@ECHO on