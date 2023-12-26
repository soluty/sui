@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if exist "%USERPROFILE%\AppData\Local\nvim" (
  move "%USERPROFILE%\AppData\Local\nvim" "%USERPROFILE%\AppData\Local\nvim.bak"
)
mklink /D "%USERPROFILE%\AppData\Local\nvim" "%xdir%"
