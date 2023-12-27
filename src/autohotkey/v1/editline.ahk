#Include %A_ScriptDir%\common.ahk

; common edit line interface
#If WinActive("ahk_exe Explorer.EXE")
 or WinActive("ahk_exe notepad.exe")
 or WinActive("ahk_exe NotepadNext.exe")
 or WinActive("ahk_exe Code.exe")
 or WinActive("ahk_exe chrome.exe")
$^SUI_行编辑::
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
  SUI_小s::
    ctrl_e_var_editline := false
    Send +{Home}{Backspace}
  return
  SUI_小f::
    ctrl_e_var_editline := false
    Send +{End}{Backspace}
  return
  SUI_小j::
    Send ^{Backspace}
  return
  SUI_小l::
    Send ^{Delete}
  return
  Left::
    Send ^SUI_直通^{Left}^+SUI_直通
  return
  Right::
    Send ^SUI_直通^{Right}^+SUI_直通
  return
  SUI_拷贝::
    ctrl_e_var_editline := false
    Send {End}+{Home}^c{Home}
  return
  SUI_粘贴::
    ctrl_e_var_editline := false
    Send ^v
  return
  *SUI_撤销::
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
$^SUI_行编辑::
ctrl_e_var_editline_cli := true
IME_SET(0)
Sleep 500
IME_SET(1)
Sleep 500
ctrl_e_var_editline_cli := false
return
#If (ctrl_e_var_editline_cli)
  $SUI_删除::
    ctrl_e_var_editline_cli := false
    Send ^SUI_行编辑SUI_删除
  return
  SUI_行编辑::
    ctrl_e_var_editline_cli := false
    Send ^SUI_行编辑SUI_行编辑
  return
  $*SUI_撤销::
    ctrl_e_var_editline_cli := false
    if (GetKeyState("Shift","P")){
      ; todo redo
      return
    }
    Send ^SUI_行编辑SUI_撤销
  return
  $SUI_小s::
    ctrl_e_var_editline_cli := false
    Send ^SUI_行编辑SUI_小s
  return
  $SUI_小f::
    ctrl_e_var_editline_cli := false
    Send ^SUI_行编辑SUI_小f
  return
  $*SUI_直通::
    ctrl_e_var_editline_cli := false
    if (GetKeyState("Shift","P")){
      Send ^SUI_行编辑+SUI_直通
      return
    }
    Send ^SUI_行编辑SUI_直通
  return
  $Left::
    Send ^+[
  return
  $Right::
    Send ^+]
  return
  SUI_小j::
    Send ^+SUI_小j
  return
  SUI_小l::
    Send ^+SUI_小l
  return
  ~SUI_拷贝::
  ; todo
  return
  ~SUI_粘贴::
  ; todo
  return
#If
