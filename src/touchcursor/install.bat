@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0
set "layout=%~1"
echo TouchCursor layout is: %layout%
if not exist "%USERPROFILE%\AppData\Roaming\TouchCursor" (
  md "%USERPROFILE%\AppData\Roaming\TouchCursor"
)

if exist "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" (
  del "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak"
  move "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak"
)
mklink "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" "%xdir%settings_%layout%.cfg"
