@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

goto :jump

if exist "%USERPROFILE%\AppData\Local\nvim" (
  move "%USERPROFILE%\AppData\Local\nvim" "%USERPROFILE%\AppData\Local\nvim.bak"
)
mklink /D "%USERPROFILE%\AppData\Local\nvim" "%xdir%"

:jump
echo nvim now cant use