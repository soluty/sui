@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

md %USERPROFILE%\AppData\Roaming\TouchCursor
if exist %USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg (
  move %USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg  %USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg.bak
)
mklink %USERPROFILE%\AppData\Roaming\TouchCursor\settings.cfg  %xdir%settings.cfg
