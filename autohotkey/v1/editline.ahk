#Include %A_ScriptDir%\common.ahk

; common edit line interface
#If WinActive("ahk_exe Explorer.EXE")
 or WinActive("ahk_exe notepad.exe")
 or WinActive("ahk_exe NotepadNext.exe")
 or WinActive("ahk_exe Code.exe")
$^e::
ctrl_e_var_editline := true
IME_SET(0)
Sleep 500
IME_SET(1)
Sleep 500
ctrl_e_var_editline := false
return
#If (ctrl_e_var_editline)
  Esc::
    ctrl_e_var_editline := false
  return
  d::
    ctrl_e_var_editline := false
    Send {End}+{Home}{Backspace}
  return
  s::
    ctrl_e_var_editline := false
    Send +{Home}{Backspace}
  return
  t::
    ctrl_e_var_editline := false
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
    ctrl_e_var_editline := false
    Send {End}+{Home}^c{Home}
  return
  p::
    ctrl_e_var_editline := false
    Send ^v
  return
  *u::
    ctrl_e_var_editline := false
    if (GetKeyState("Shift","P")){
      Send ^z
      return
    }
    Send ^z
  return
#If


#If WinActive("ahk_exe cmd.exe")
 or WinActive("ahk_exe wezterm-gui.exe")
$^e::
ctrl_e_var_editline_cli := true
IME_SET(0)
Sleep 500
IME_SET(1)
Sleep 500
ctrl_e_var_editline_cli := false
return
#If (ctrl_e_var_editline_cli)
  $d::
    ctrl_e_var_editline_cli := false
    Send ^ed
  return
  e::
    ctrl_e_var_editline_cli := false
    Send ^ee
  return
  $*u::
    ctrl_e_var_editline_cli := false
    if (GetKeyState("Shift","P")){
      ; todo redo
      return
    }
    Send ^eu
  return
  $s::
    ctrl_e_var_editline_cli := false
    Send ^es
  return
  $t::
    ctrl_e_var_editline_cli := false
    Send ^et
  return
  $*f::
    ctrl_e_var_editline_cli := false
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
