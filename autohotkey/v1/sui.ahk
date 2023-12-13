#SingleInstance Force
EnvGet, HOME, USERPROFILE
EnvGet, SUI_ROOT, SUI_ROOT
EnvGet, SystemRoot, SystemRoot

global im_now := 0

IME_SET(setSts, WinTitle="")
{
  im_now := setSts
  ifEqual WinTitle,,  SetEnv, WinTitle, A
  WinGet, hWnd, ID, %WinTitle%
  DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hWnd, Uint)

  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows, ON
  SendMessage 0x283, 0x006, setSts,, ahk_id %DefaultIMEWnd%
  DetectHiddenWindows, %DetectSave%
  Return ErrorLevel
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

;uncommont this to see what will alt+c do
;!c::
;ToolTip, cool sui!!!!!!!
;return
; CapsLock map to Esc/Alt
CapsLock::Send {Esc}
CapsLock & a::Send !a
CapsLock & b::Send !b
CapsLock & c::Send !c
CapsLock & d::Send !d
CapsLock & e::Send !e
CapsLock & f::Send !f
CapsLock & g::Send !g
CapsLock & h::Send !h
CapsLock & i::Send !i
CapsLock & j::Send !j
CapsLock & k::Send !k
CapsLock & l::Send !l
CapsLock & m::Send !m
CapsLock & n::Send !n
CapsLock & o::Send !o
CapsLock & p::Send !p
CapsLock & q::Send !q
CapsLock & r::Send !r
CapsLock & s::Send !s
CapsLock & t::Send !t
CapsLock & u::Send !u
CapsLock & v::Send !v
CapsLock & w::Send !w
CapsLock & x::Send !x
CapsLock & y::Send !y
CapsLock & z::Send !z
CapsLock & ,::Send !,
CapsLock & .::Send !.
CapsLock & Left::Send !{Left}
CapsLock & Right::Send !{Right}
CapsLock & Up::Send !{Up}
CapsLock & Down::Send !{Down}
CapsLock & PgUp::Send !{PgUp}
CapsLock & PgDn::Send !{PgDn}
CapsLock & Home::Send !{Home}
CapsLock & End::Send !{End}

RCtrl & a::Send ^!a
RCtrl & b::Send ^!b
RCtrl & c::Send ^!c
RCtrl & d::Send ^!d
RCtrl & e::Send ^!e
RCtrl & f::Send ^!f
RCtrl & g::Send ^!g
RCtrl & h::Send ^!h
RCtrl & i::Send ^!i
RCtrl & j::Send ^!j
RCtrl & k::Send ^!k
RCtrl & l::Send ^!j
RCtrl & m::Send ^!m
RCtrl & n::Send ^!n
RCtrl & o::Send ^!o
RCtrl & p::Send ^!p
RCtrl & q::Send #q
RCtrl & r::Send ^!r
RCtrl & s::Send ^!s
RCtrl & t::Send ^!t
RCtrl & u::Send ^!u
RCtrl & v::Send ^!v
RCtrl & w::Send ^!w
RCtrl & x::Send ^!x
RCtrl & y::Send ^!y
RCtrl & z::Send ^!z
RCtrl & ,::Send ^!,
RCtrl & .::Send ^!.
RCtrl & Left::Send ^!{Left}
RCtrl & Right::Send ^!{Right}
RCtrl & Up::Send ^!{Up}
RCtrl & Down::Send ^!{Down}
RCtrl & PgUp::Send ^!{PgUp}
RCtrl & PgDn::Send ^!{PgDn}
RCtrl & Home::Send ^!{Home}
RCtrl & End::Send ^!{End}

AppsKey & a::Send ^!a
AppsKey & b::Send ^!b
AppsKey & c::Send ^!c
AppsKey & d::Send ^!d
AppsKey & e::Send ^!e
AppsKey & f::Send ^!f
AppsKey & g::Send ^!g
AppsKey & h::Send ^!h
AppsKey & i::Send ^!i
AppsKey & j::Send ^!j
AppsKey & k::Send ^!k
AppsKey & l::Send ^!j
AppsKey & m::Send ^!m
AppsKey & n::Send ^!n
AppsKey & o::Send ^!o
AppsKey & p::Send ^!p
AppsKey & q::Send #q
AppsKey & r::Send ^!r
AppsKey & s::Send ^!s
AppsKey & t::Send ^!t
AppsKey & u::Send ^!u
AppsKey & v::Send ^!v
AppsKey & w::Send ^!w
AppsKey & x::Send ^!x
AppsKey & y::Send ^!y
AppsKey & z::Send ^!z
AppsKey & ,::Send ^!,
AppsKey & .::Send ^!.
AppsKey & Left::Send ^!{Left}
AppsKey & Right::Send ^!{Right}
AppsKey & Up::Send ^!{Up}
AppsKey & Down::Send ^!{Down}
AppsKey & PgUp::Send ^!{PgUp}
AppsKey & PgDn::Send ^!{PgDn}
AppsKey & Home::Send ^!{Home}
AppsKey & End::Send ^!{End}

; sui backup interface
#If WinActive("ahk_exe chrome.exe")
 or WinActive("ahk_exe firefox.exe")
 or WinActive("ahk_exe msedge.exe")
 or WinActive("ahk_exe vivaldi.exe")
 or WinActive("ahk_exe brave.exe")
^b::
ctrl_b_var := true
Sleep 1000
ctrl_b_var := false
return
#If (ctrl_b_var)
  q::
  ctrl_b_var := false
  Send ^{F4}
  return
  r::
  ctrl_b_var := false
  Send ^{F5}
  return
#If
return
#If

#IfWinActive, ahk_exe Code.exe
^b::
ctrl_b_var := true
Sleep 1000
ctrl_b_var := false
return
#If (ctrl_b_var)
  .::
  ctrl_b_var := false
  Send ^+p
  return
#If
#IfWinNotActive


; sui fallthrough interface
fall_through := false
$^v::
if(fall_through){
  Send ^v
  return
}
ToolTip press c-v...
return

$^f::
if(fall_through){
  Send ^f
  return
}
fall_through := true
SetTimer, FallThroughTimer, -1000
return
FallThroughTimer:
  fall_through := false
  SetTimer, FallThroughTimer, Off
return

$^+f::
fall_through := false
Send ^+f
return

^.::
ctrl_dot_var := true
Sleep 1000
ctrl_dot_var := false
return
#If (ctrl_dot_var)
  s::
  ctrl_dot_var := false
  Reload
  return
#If

; edit line interface in common gui app in windows
#If WinActive("ahk_exe Explorer.EXE")
 or WinActive("ahk_exe notepad.exe")
 or WinActive("ahk_exe wezterm-gui.exe")
 or WinActive("ahk_exe cmd.exe")
^e::
ctrl_e_var := true
Sleep 1000
ctrl_e_var := false
return
#If (ctrl_e_var and (WinActive("ahk_exe Explorer.EXE") or WinActive("ahk_exe notepad.exe")))
  Esc::
    ctrl_e_var := false
  return
  d::
    ctrl_e_var := false
    Send {End}+{Home}{Backspace}
  return
  s::
    ctrl_e_var := false
    Send +{Home}{Backspace}
  return
  t::
    ctrl_e_var := false
    Send +{End}{Backspace}
  return
  n::
    Send ^{Backspace}
  return
  o::
    Send ^{Delete}
  return
  Left::
    Send ^f^{Left}^+f
  return
  Right::
    Send ^f^{Right}^+f
  return
  y::
    ctrl_e_var := false
    Send {End}+{Home}^c{Home}
  return
  p::
    ctrl_e_var := false
    Send ^v
  return
  *u::
    ctrl_e_var := false
    if (GetKeyState("Shift","P")){
      Send ^z
      return
    }
    Send ^z
  return
#If
#If (ctrl_e_var and (WinActive("ahk_exe cmd.exe") or WinActive("ahk_exe wezterm-gui.exe")))
  $d::
    ctrl_e_var := false
    Send ^ed
  return
  $*u::
    ctrl_e_var := false
    if (GetKeyState("Shift","P")){
      ; todo redo
      return
    }
    Send ^eu
  return
  $s::
    ctrl_e_var := false
    Send ^es
  return
  $t::
    ctrl_e_var := false
    Send ^et
  return
  $*f::
    ctrl_e_var := false
    if (GetKeyState("Shift","P")){
      Send ^e+f
      return
    }
    Send ^ef
  return
  $Left::
    Send ^+[
  return
  $Right::
    Send ^+]
  return
  n::
    Send ^+n
  return
  o::
    Send ^+o
  return
  ~y::
  ; todo
  return
  ~p::
  ; todo
  return
#If
#If


$^l::
ctrl_l_var := true
im_current := im_now
IME_SET(0)
Sleep 500
IME_SET(im_current)
Sleep 500
ctrl_l_var := false
return
#If (ctrl_l_var)
  l::
    ctrl_l_var := false
    Send ^ll
  return
  ^l::
    ctrl_l_var := false
    Send ^ll
  return
  v::
    ctrl_l_var := false
    Send ^lv
  return
  h::
    ctrl_l_var := false
    Send ^lh
  return
  f::
    ctrl_l_var := false
    Send ^lf
  return
  w::
    ctrl_l_var := false
    Send ^lw
  return
  r::
    ctrl_l_var := false
    Send ^lr
  return
  c::
    ctrl_l_var := false
    Send ^lc
  return
  n::
  ctrl_l_var := false
  ctrl_ln_var := true
  return
#If
#If ctrl_ln_var
  c::
  ctrl_ln_var := false
  Run, cmd.exe
  return
#If

; quit interface
$^q::
ctrl_q_var := true
Sleep 1000
ctrl_q_var := false
return
#If (ctrl_q_var)
  .::
  ctrl_q_var := false
  RunWait, "%HOME%\AppData\Local\Programs\utools\uTools.exe"
  Send kill{Space}{Space}
  return
  o::
  ctrl_q_var := false
  Run, python "%SUI_ROOT%\sui\not_implement.py"
  return
  n::
  ctrl_q_var := false
  Run, python "%SUI_ROOT%\sui\not_implement.py"
  return
  q::
  ctrl_q_var := false
  if WinActive("ahk_exe SnippingTool.exe")
  || WinActive("ahk_exe ScreenToGif.exe")
  {
    Send !{F4}
    return
  }
  Send ^qq
  return
  ^q::
  ctrl_q_var := false
  Send ^qq
  return
  t::
  ctrl_q_var := false
  Send ^qt
  return
  w::
  ctrl_q_var := false
  Send ^qw
  return
  a::
  ctrl_q_var := false
  Send ^qa
  return
return
#If

; use in glazewm window manager, if your manager is komorebi, uncommont this
^Up::
Send ^k^{Left}^{Right}
return
^Down::
Send ^k^{Left}^{Right}
return


; copy interface in window manager
GetWindowInfo(hwnd) {
  WinGetTitle, title, ahk_id %hwnd%
  WinGetClass, class, ahk_id %hwnd%
  WinGet, processPath, ProcessPath, ahk_id %hwnd%
  WinGet, processName, ProcessName, ahk_id %hwnd%
  WinGetPos, x, y, width, height, ahk_id %hwnd%
  info = 窗口标题：%title%`n窗口类名：%class%`n窗口位置：%x%, %y%`n窗口尺寸：%width%x%height%`n所属进程：%processName%`n进程路径：%processPath%
  Clipboard := info
}

SendHttpGet(url) {
  req := ComObjCreate("Msxml2.XMLHTTP")
  req.open("GET", url, true)
  req.send()
  ;Run, %comspec% /c xh get %url%, , Hide
}

^y::
ctrl_y_var := true
Sleep 1000
ctrl_y_var := false
return
#If (ctrl_y_var)
  y::
  ctrl_y_var := false
  Run "%SUI_ROOT%\sui\bin\ScreenCapture.exe"
  return
  a::
  ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !ms
  return
  r::
  ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mr
  return
  .::
  ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mf
  return
  w::
  ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mw
  return
  *n::
  ctrl_y_var := false
  if (GetKeyState("Shift","P")){
    WinGet, processPath, ProcessPath, ahk_id %hwnd%
    Clipboard := processPath
    return
  }
  WinGet, processNamew, ProcessName, A
  Clipboard := processNamew
  return
  i::
  ctrl_y_var := false
  WinGetActiveTitle, activeTitle
  WinGet, activeHwnd, ID, %activeTitle%
  GetWindowInfo(activeHwnd)
  return
  g:: ; neep ScreenToGif run in daemon and set start shortcut
  ctrl_y_var := false
  Send, ^{F12}
  return
  p::
  ctrl_y_var := false
  ctrl_yp_var := true
  return
#If
#If ctrl_yp_var
  t:: ; neet pot run in daemon
  ctrl_yp_var := false
  SendHttpGet("http://127.0.0.1:60828/ocr_recognize?screenshot=true")
  return
#If

$^s::
ctrl_s_var := true
Sleep 1000
ctrl_s_var := false
return
#If (ctrl_s_var)
  m::
    ctrl_s_var := false
    Send ^sm
  return
  z::
    ctrl_s_var := false
    Send ^sz
  return
  r::
    ctrl_s_var := false
    Send ^sr
  return
  i::
    ctrl_s_var := false
    Send ^si
  return
  n::
    ctrl_s_var := false
    Send ^sn
  return
  o::
    ctrl_s_var := false
    Send ^so
  return
  h::
    ctrl_s_var := false
    Send ^sh
  return
  u::
    SoundGet, currentVolume
    newVolume := currentVolume + 5
    SoundSet, %newVolume%
  return
  d::
    SoundGet, currentVolume
    newVolume := currentVolume - 5
    SoundSet, %newVolume%
  return
  s::
    ctrl_s_var := false
    SoundSet, 50
  return
#If

^w::
ctrl_w_var := true
return
#If (ctrl_w_var)
  !r::
  Send {Up}
  return
  !i::
  Send {Down}
  return
  !n::
  Send {Left}
  return
  !o::
  Send {Right}
  return
  .::
  Send  {Alt Down}{Tab Down}
  return
  !Esc::
  ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  !CapsLock::
  ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  !Enter::
  ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  Esc::
  ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  CapsLock::
  ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  Enter::
  ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
#If

