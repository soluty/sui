@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if not exist "%xdir%\GlazeWM.exe" (
  "%ProgramFiles%/Git/usr/bin/unzip.exe" "%xdir%GlazeWM.zip"
)

@REM if not exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\glazewm.lnk" (
@REM   "%xdir%\nircmd.exe" shortcut "%xdir%\GlazeWM.exe" %xdir% "glazewm"
@REM   move "%xdir%\glazewm.lnk" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
@REM )
