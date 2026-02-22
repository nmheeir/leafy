@echo off
setlocal enabledelayedexpansion

:: 1. Lấy đường dẫn thư mục hiện tại nơi file .bat đang đứng
set "base_dir=%~dp0"
set "folder=%base_dir%docs/app-mockup"

:: 2. Tạo thư mục Screenshots nếu chưa có
if not exist "%folder%" mkdir "%folder%"

:: 3. Tạo tên file theo ngày giờ (YYYYMMDD_HHMMSS)
set "datestr=%date:~10,4%%date:~4,2%%date:~7,2%"
set "timestr=%time:~0,2%%time:~3,2%%time:~6,2%"
set "timestr=%timestr: =0%"
set "filename=shot_%datestr%_%timestr%.png"

echo Dang chup man hinh...

:: 4. Chụp và kéo về thư mục Screenshots tại chỗ
adb shell screencap -p /sdcard/screen_temp.png
adb pull /sdcard/screen_temp.png "%folder%\%filename%"
adb shell rm /sdcard/screen_temp.png

echo.
echo ---------------------------------------
echo Da luu tai: %folder%\%filename%
echo ---------------------------------------
pause