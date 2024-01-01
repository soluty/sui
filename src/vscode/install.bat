@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0

if exist "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" (
  if not exist "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json.bak" (
    echo sui find there is vscode's original config, backup it.
    move "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json.bak"
  ) else (
    echo vscode has a backup file, skip backup.
  ) 
  del "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json"
)
mklink "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" "%xdir%keybindings.json"
