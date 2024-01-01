@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0
set "TempFile=%temp%\SuiTemp.txt"

fsutil reparsepoint query "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg" >"%TempFile%" 2>&1
if errorlevel 1 (
  echo sui did not install TouchCursor's config, do nothing with it
) else (
  del "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg"
  echo delete sui's TouchCursor config ok.
  if exist "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak" (
    move "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak" "%USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg"
    echo sui check there is a TouchCursor's backup config, reinstall your backup config for you.
  )
)
