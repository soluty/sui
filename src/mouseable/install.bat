@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

md %APPDATA%\mouseable\configs

if exist %APPDATA%\mouseable\configs\qwerty-wasd.json (
  move %APPDATA%\mouseable\configs\qwerty-wasd.json  %APPDATA%\mouseable\configs\qwerty-wasd.json.bak
)
mklink %APPDATA%\mouseable\configs\qwerty-wasd.json  "%xdir%\config.json"
