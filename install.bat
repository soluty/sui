@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

REM exec sub dirs install.bat
for /f %%i in ('dir /b /ad "%xdir%"') do (
  if exist "%xdir%\%%i\install.bat" (
    echo install %%i's config...
    call "%xdir%\%%i\install.bat" "%~1"
    if %errorlevel%==0 (
      echo install %%i ok
    )
  )
)
pause
