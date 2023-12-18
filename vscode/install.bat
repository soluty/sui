@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if exist "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" (
  move "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json.bak"
)
mklink "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" "%xdir%keybindings.json"
