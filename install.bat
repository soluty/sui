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

setx SUI_ROOT %xdir%

if not exist "%xdir%build" (
  md "%xdir%build"
)
if not exist "%xdir%build\%layout%" (
  md "%xdir%build\%layout%"
)
echo copy src to build dir...
xcopy /E /I "%xdir%src" "%xdir%build\%layout%"

if %errorlevel%==0 (
  goto :installsui
) else (
  echo copy build dir error..
  echo stop sui install!!!
  exit
)

:installsui

echo change layout to %layout%...
"%xdir%sui\layoutchanger\layoutchanger.exe" -l "%layout%"

echo install bin...
call "%xdir%bin\install.bat" "%~1"

REM exec sub dirs install.bat
for /f %%i in ('dir /b /ad "%xdir%build\%layout%"') do (
  if exist "%xdir%build\%layout%\%%i\install.bat" (
    echo install %%i's config...
    call "%xdir%build\%layout%\%%i\install.bat" "%~1"
    if %errorlevel%==0 (
      echo install %%i ok
    )
  )
)
pause
