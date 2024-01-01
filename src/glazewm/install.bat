@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if exist "%USERPROFILE%\.glaze-wm\config.yaml" (
  if not exist "%USERPROFILE%\.glaze-wm\config.yaml.bak" (
    echo sui find there is glazewm's original config, backup it.
    move "%USERPROFILE%\.glaze-wm\config.yaml" "%USERPROFILE%\.glaze-wm\config.yaml.bak"
  ) else (
    echo glazewm has a backup file, skip backup.
  ) 
  del "%USERPROFILE%\.glaze-wm\config.yaml"
)
mklink "%USERPROFILE%\.glaze-wm\config.yaml"  "%xdir%\config.yaml"
