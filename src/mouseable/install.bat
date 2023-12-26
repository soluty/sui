@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if not exist "%APPDATA%\mouseable\configs" (
  md "%APPDATA%\mouseable\configs"
)

if exist "%APPDATA%\mouseable\configs\qwerty-wasd.json" (
  del "%APPDATA%\mouseable\configs\qwerty-wasd.json.bak"
  move "%APPDATA%\mouseable\configs\qwerty-wasd.json"  "%APPDATA%\mouseable\configs\qwerty-wasd.json.bak"
)
mklink "%APPDATA%\mouseable\configs\qwerty-wasd.json"  "%xdir%\config.json"
