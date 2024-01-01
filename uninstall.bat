@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

set "defaultlayout=qwerty"
set "layout=%~1"

if "%layout%"=="" (
  set "layout=%defaultlayout%"
)
if "%layout%"=="norman" (
  goto :continue
) 
if "%layout%"=="qwerty" (
  goto :continue
)

echo currently sui do not support layout: %layout%
exit \b

:continue

echo your keyboard layout is: %layout%

if not exist "%xdir%build\%layout%" (
  echo sui not existed in your computer.
  pause
  exit
)

echo start to uninstall sui...

REM exec sub dirs install.bat
for /f %%i in ('dir /b /ad "%xdir%build\%layout%"') do (
  if exist "%xdir%build\%layout%\%%i\uninstall.bat" (
    echo uninstall %%i's config...
    call "%xdir%build\%layout%\%%i\uninstall.bat" "%layout%"
    if %errorlevel%==0 (
      echo uninstall %%i ok
    )
  )
)
pause
