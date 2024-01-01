@echo off
setlocal enabledelayedexpansion
set xdir=%~dp0
set "TempFile=%temp%\SuiTemp.txt"

fsutil reparsepoint query "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json" >"%TempFile%" 2>&1
if errorlevel 1 (
  echo sui did not install vscode's config, do nothing with it
) else (
  del "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json"
  echo delete sui's vscode config ok.
  if exist "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json.bak" (
    move "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json.bak" "%USERPROFILE%\AppData\Roaming\Code\User\keybindings.json"
    echo sui check there is a vscode's backup config, reinstall your backup config for you.
  )
)
