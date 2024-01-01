@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0
set "layout=%~1"
echo TouchCursor layout is: %layout%
if not exist "%USERPROFILE%\AppData\Roaming\TouchCursor" (
  md "%USERPROFILE%\AppData\Roaming\TouchCursor"
)

if exist "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" (
  if not exist "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak" (
    echo sui find there is TouchCursor's original config, backup it.
    move "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak"
  ) else (
    echo TouchCursor has a backup file, skip backup.
  ) 
  del "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg"
)
mklink "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" "%xdir%settings_%layout%.cfg"
