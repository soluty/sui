global SUI_CURRENT_IM := 0

IME_SET(setSts, WinTitle="")
{
  SUI_CURRENT_IM := setSts
  ifEqual WinTitle,,  SetEnv, WinTitle, A
  WinGet, hWnd, ID, %WinTitle%
  DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hWnd, Uint)

  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows, ON
  SendMessage 0x283, 0x006, setSts,, ahk_id %DefaultIMEWnd%
  DetectHiddenWindows, %DetectSave%
  Return ErrorLevel
}

; copy interface in window manager
GetWindowInfo(hwnd) {
  WinGetTitle, title, ahk_id %hwnd%
  WinGetClass, class, ahk_id %hwnd%
  WinGet, processPath, ProcessPath, ahk_id %hwnd%
  WinGet, processName, ProcessName, ahk_id %hwnd%
  WinGetPos, x, y, width, height, ahk_id %hwnd%
  info = wtitle：%title%`nwclass：%class%`nwpos：%x%, %y%`nwsize：%width%x%height%`nwprocess：%processName%`nwpass：%processPath%
  Clipboard := info
}

SendHttpGet(url) {
  req := ComObjCreate("Msxml2.XMLHTTP")
  req.open("GET", url, true)
  req.send()
  ;Run, %comspec% /c xh get %url%, , Hide
}


~LShift up::
  if(GetKeyState(";")) {
    return
  }
  if (GetKeyState("CapsLock", "T")) {
    SetCapsLockState, Off
  }
  if (WinExist("ahk_class SoPY_Comp")){
    Send {Enter}
  }
  IME_SET(0)
return

~RShift::
  if (GetKeyState("CapsLock", "T")) {
    SetCapsLockState, Off
  }
  IME_SET(1)
return

Contains(arr, str){
  for index, value in arr {
    if (value = str) {
      return true
    }
  }
  return false
}

global SUI_WM_FALL_THROUGH := false
; sui fallthrough interface
$^SUI_直通::
if(SUI_WM_FALL_THROUGH){
  Send ^SUI_直通
  return
}
SUI_WM_FALL_THROUGH := true
SetTimer, FallThroughTimer, -1000
return
FallThroughTimer:
  SUI_WM_FALL_THROUGH := false
  SetTimer, FallThroughTimer, Off
return

$^+SUI_直通::
SUI_WM_FALL_THROUGH := false
Send ^+SUI_直通
return
