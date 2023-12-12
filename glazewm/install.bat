@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if exist "%USERPROFILE%\.glaze-wm\config.yaml" (
  mv "%USERPROFILE%\.glaze-wm\config.yaml" "%USERPROFILE%\.glaze-wm\config.yaml.bak"
)
mklink "%USERPROFILE%\.glaze-wm\config.yaml"  "%xdir%\config.yaml"
