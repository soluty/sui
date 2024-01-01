@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if not exist "%APPDATA%\mouseable\configs" (
  md "%APPDATA%\mouseable\configs"
)

if exist "%APPDATA%\mouseable\configs\qwerty-wasd.json" (
  if not exist "%APPDATA%\mouseable\configs\qwerty-wasd.json.bak" (
    echo sui find there is mouseable's original config, backup it.
    move "%APPDATA%\mouseable\configs\qwerty-wasd.json" "%APPDATA%\mouseable\configs\qwerty-wasd.json.bak"
  ) else (
    echo mouseable has a backup file, skip backup.
  ) 
  del "%APPDATA%\mouseable\configs\qwerty-wasd.json"
)
mklink "%APPDATA%\mouseable\configs\qwerty-wasd.json" "%xdir%\config.json"
