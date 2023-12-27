;fallthrough
$^Left::
if(SUI_WM_FALL_THROUGH){
  Send ^Left
  return
}
Send ^{F3}
return
$^Right::
if(SUI_WM_FALL_THROUGH){
  Send ^Right
  return
}
Send ^{F2}
return

; launch interface
$^SUI_打开::
ctrl_l_var := true
im_current := SUI_CURRENT_IM
IME_SET(0)
Sleep 500
IME_SET(im_current)
Sleep 500
ctrl_l_var := false
return
#If (ctrl_l_var)
  SUI_打开::
    ctrl_l_var := false
    Send ^SUI_打开SUI_打开
  return
  ^SUI_打开::
    ctrl_l_var := false
    Send ^SUI_打开SUI_打开
  return
  v::
    ctrl_l_var := false
    Send ^SUI_打开v
  return
  h::
    ctrl_l_var := false
    Send ^SUI_打开h
  return
  f::
    ctrl_l_var := false
    Send ^SUI_打开f
  return
  w::
    ctrl_l_var := false
    Send ^SUI_打开w
  return
  r::
    ctrl_l_var := false
    Send ^SUI_打开r
  return
  c::
    ctrl_l_var := false
    Send ^SUI_打开c
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
$^SUI_关闭::
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
  SUI_关闭::
  ctrl_q_var := false
  if WinActive("ahk_exe SnippingTool.exe")
  || WinActive("ahk_exe ScreenToGif.exe")
  {
    Send !{F4}
    return
  }
  Send ^SUI_关闭SUI_关闭
  return
  ^SUI_关闭::
  ctrl_q_var := false
  Send ^SUI_关闭SUI_关闭
  return
  SUI_标签::
  ctrl_q_var := false
  Send ^SUI_关闭SUI_标签
  return
  SUI_窗口::
  ctrl_q_var := false
  Send ^SUI_关闭SUI_窗口
  return
  a::
  ctrl_q_var := false
  Send ^SUI_关闭a
  return
return
#If

; use in glazewm window manager, if your manager is komorebi, uncommont this
^Up::
Send ^k
Send ^{F3}
Send ^{F2}
return
^Down::
Send ^k
Send ^{F3}
Send ^{F2}
return
; size interface
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

; tabto interface
^t::
if (SUI_WM_FALL_THROUGH) {
  ToolTip fallthrough..
  Send ^t
  return
}
IME_SET(0)
ctrl_t_var_glaezwm := true
Sleep 1000
return
#If (ctrl_t_var_glaezwm)
  e::
  ctrl_t_var_glaezwm := false
  Send ^t
  Send e
  return
  b::
  ctrl_t_var_glaezwm := false
  Send ^t
  Send b
  return
  t::
  ctrl_t_var_glaezwm := false
  Send ^t
  Send t
  return
  d::
  ctrl_t_var_glaezwm := false
  Send ^t
  Send d
  return
  i::
  ctrl_t_var_glaezwm := false
  Send ^t
  Send i
  return
#If
