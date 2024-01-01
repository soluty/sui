@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0
set "TempFile=%temp%\SuiTemp.txt"

fsutil reparsepoint query "%APPDATA%\mouseable\configs\qwerty-wasd.json" >"%TempFile%" 2>&1
if errorlevel 1 (
  echo sui did not install mouseable's config, do nothing with it
) else (
  del "%APPDATA%\mouseable\configs\qwerty-wasd.json"
  echo delete sui's mouseable config ok.
  if exist "%APPDATA%\mouseable\configs\qwerty-wasd.json.bak" (
    move "%APPDATA%\mouseable\configs\qwerty-wasd.json.bak" "%APPDATA%\mouseable\configs\qwerty-wasd.json.cfg"
    echo sui check there is a mouseable's backup config, reinstall your backup config for you.
  )
)
