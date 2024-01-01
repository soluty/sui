@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0
set "TempFile=%temp%\SuiTemp.txt"

fsutil reparsepoint query "%USERPROFILE%\.glaze-wm\config.yaml" >"%TempFile%" 2>&1
if errorlevel 1 (
  echo sui did not install glazewm's config, do nothing with it
) else (
  del "%USERPROFILE%\.glaze-wm\config.yaml"
  echo delete sui's glazewm config ok.
  if exist "%USERPROFILE%\.glaze-wm\config.yaml.bak" (
    move "%USERPROFILE%\.glaze-wm\config.yaml.bak" "%USERPROFILE%\.glaze-wm\config.yaml"
    echo sui check there is a glazewm's backup config, reinstall your backup config for you.
  )
)
