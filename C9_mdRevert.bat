@echo off
Setlocal ENABLEDELAYEDEXPANSION

for /f "tokens=* delims=" %%i in ('dir *.md* /a:-d/s/b') do (
echo "md-file = "%%i

cd /d %userprofile%\Desktop\zbin
call C9.bat %userprofile%\Desktop\zbin  %%i
)

echo end!
pause