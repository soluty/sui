#If (!ctrl_w_var_sui and WinActive("ahk_exe Explorer.EXE"))
!y::
alt_y_var := true
Sleep 1000
alt_y_var := false
return
!n:: ; goto sidebar
Send ^f
Send ^f
Send ^+f
Send {Tab}
return
!o::
Send ^f
Send ^e
Send ^+f
Sleep 100
Send {Down}
return
!s::
Send ^f
Send ^f
Send ^+f
return
!g::
alt_g_var := true
Sleep 1000
alt_g_var := false
return
!l::
alt_l_var := true
Sleep 1000
alt_l_var := false
return
!r::
Send !{Up}
return
!i::
Send {Enter}
return
#IfWinActive

#If (alt_l_var and WinActive("ahk_exe Explorer.EXE"))
  f::  ; new file
  alt_l_var := false
  Send !h
  Sleep 50
  Send w
  Sleep 50
  Send t
  return
  d::  ; new dir
  alt_l_var := false
  Send ^+n
  return
#If

#If (alt_g_var and WinActive("ahk_exe Explorer.EXE"))
  n::
  alt_g_var := false
  Send !{Left}
  return
  o::
  alt_g_var := false
  Send !{Right}
  return
  .::
  alt_g_var := false
  Send !{d}!{Down}
  return
#If

#If (alt_y_var and WinActive("ahk_exe Explorer.EXE"))
  n::
    alt_y_var := false
    Send {F2}
    Sleep 100
    Send ^c{Esc}
  return
  p::
    alt_y_var := false
    Send !h
    Sleep 100
    Send cp
  return
#If
