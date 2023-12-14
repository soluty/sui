#SingleInstance Force
EnvGet, HOME, USERPROFILE
EnvGet, SUI_ROOT, SUI_ROOT
EnvGet, SystemRoot, SystemRoot
EnvGet, SUI_MODULES, SUI_MODULES
EnvGet, SUI_WM, SUI_WM
ToolTip reloadsuiok...
Sleep 500
ToolTip

#Include %A_ScriptDir%\common.ahk

if (SUI_WM="komorebi") {
  #Include %A_ScriptDir%\komorebi\init.ahk
} else {
  #Include %A_ScriptDir%\glazewm\init.ahk
}

if (SUI_MODULES="" || Contains(SUI_MODULES, "browser")) {
  #Include %A_ScriptDir%\browser.ahk
}
if (SUI_MODULES="" || Contains(SUI_MODULES, "vscode")) {
  #Include %A_ScriptDir%\vscode\init.ahk
}
if (SUI_MODULES="" || Contains(SUI_MODULES, "wezterm")) {
  #Include %A_ScriptDir%\wezterm\init.ahk
}

; CapsLock map to Esc/Alt
*CapsLock::
if (WinExist("ahk_class SoPY_Comp")){
  Send {Enter}
}
vimApps := ["goland64.exe","Code.exe","idea.exe","cmd.exe","wezterm-gui.exe","obsidian.exe"]
for k,app in vimApps {
  if WinActive("ahk_exe " . app){
    SendInput {Blind}{Esc Down}{Esc Up}
    IME_SET(0)
    SendInput {Blind}{Esc Down}{Esc Up}
    return
  }
}

sbApps :=  ["Wechat.exe","WXWork.exe","QQ.exe"]
for k,app in sbApps {
  if WinActive("ahk_exe " . app) {
    WinActivate, ahk_class Shell_TrayWnd
    return
  }
}
SendInput {Blind}{Esc Down}{Esc Up}
return
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

#If !WinActive("ahk_exe wezterm-gui.exe")
and !WinActive("ahk_exe Code.exe")
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
RCtrl & l::Send ^!l
RCtrl & m::Send ^!m
RCtrl & n::Send ^!n
RCtrl & o::Send ^!o
RCtrl & p::Send ^!p
RCtrl & q::Send ^!q
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
#IfWinNotActive

; interface mouse use mouseable
$^p::
if (SUI_WM_FALL_THROUGH) {
  Send ^p
  return
}
WinGetActiveStats, Title, Width, Height, X, Y
CoordMode, Mouse, Screen
MouseGetPos mx, my

if (mx > X and mx <X+Width and my > Y and my < Y+Height) {
  Sleep 200
  Send ^{F1}
  return
}
IfWinExist, %Title%
{
  SetMouseDelay, 0
  MouseMove, (X+Width/2), (Y+Height/2)
  SetMouseDelay, -1
  Sleep 200
  Send ^{F1}
}
else
{
  Sleep 200
  Send ^{F1}
}
return

^.::
ctrl_dot_var := true
Sleep 1000
ctrl_dot_var := false
return
#If (ctrl_dot_var)
  .::
  ctrl_dot_var := false
  Reload
  return
#If

; copy paste interface
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
  v::
  ToolTip start record..
  ctrl_y_var := false
  ; need obs to record video
  if WinExist("ahk_exe obs64.exe")
  {
    WinGet, obsWindow, ID, ahk_exe obs64.exe
    if (obsWindow)
    {
      screen_recording := true
      obs_window_hd := obsWindow
      ; todo make it more common
      ;WinGetActiveTitle, currentWindow
      ; Run, komorebic focus-named-workspace rss
      Send, ^td ; to obs workspace
      WinGet, currentWindow, ID, A
      WinActivate, ahk_id %obsWindow%
      WinWaitActive, ahk_id %obsWindow%
      Send, ^{F4}
      Send, ^te ; to editor workspace
      ;Run, komorebic focus-named-workspace editor
      ;WinActivate, ahk_id %currentWindow%
      ;WinWaitActive, ahk_id %currentWindow%
    }else{
      ToolTip no obs window..
    }
  }
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

#IfWinActive, ahk_exe obs64.exe
s::
if(screen_recording){
  screen_recording := false
  ToolTip
  Send, ^{F5}
  return
}
return
p::
if(screen_recording){
  ToolTip obs_is_pause..
  Send, ^{F6}
  return
}
return
r::
if(screen_recording){
  ToolTip obs_is_recording..
  Send, ^{F7}
  Sleep 1000
  ToolTip
  return
}
return
#IfWinActive


; find window interface
^w::
if (SUI_WM_FALL_THROUGH) {
  Send ^w
  return
}
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

