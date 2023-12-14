; backup interface
#IfWinActive, ahk_exe Code.exe
^b::
ctrl_b_var := true
Sleep 1000
ctrl_b_var := false
return

RCtrl::Alt
AppsKey::Alt

!*s::
if (GetKeyState("Shift","P")){
  alt_s_var := true
  return
}
return
#IfWinActive

#If (alt_s_var and WinActive("ahk_exe Code.exe"))
  ~Esc::
  alt_s_var := false
  return
  ~CapsLock::
  alt_s_var := false
  return
  r::
  Send !+sr
  return
  i::
  Send !+si
  return
  n::
  Send !+sn
  return
  o::
  Send !+so
  return
  u::
  Send !+su
  return
  d::
  Send !+sd
  return
#If
#If (ctrl_b_var and WinActive("ahk_exe Code.exe"))
  .::
  ctrl_b_var := false
  Send ^+p
  return
#If
