; backup interface
#IfWinActive, ahk_exe Code.exe
^b::
ctrl_b_var := true
Sleep 1000
ctrl_b_var := false
return
!v::
alt_v_var := true
Send !v
return

RCtrl::Alt
AppsKey::Alt

!*s::
if (GetKeyState("Shift","P")){
  alt_s_var := true
  return
}
alt_s_var := false
;alt_xiaos_var := true
Send !s
return
#IfWinActive

#If (alt_s_var and WinActive("ahk_exe Code.exe"))
  ~Esc::
  Send {Left}
  alt_s_var := false
  return
  ~CapsLock::
  Send {Left}
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
  s::
  Send !+ss
  return
  m::
  alt_s_var := false
  Send !+sm
  return
  z::
  alt_s_var := false
  Send !+sz
  return
#If

#If (alt_xiaos_var and WinActive("ahk_exe Code.exe"))
  ; if you need small s to resize, use this as bootstrap
  n::
  Send n
  return
#If


#if (ctrl_b_var and winactive("ahk_exe code.exe"))
  .::
  ctrl_b_var := false
  send ^+p
  return
#if

#if (alt_v_var and winactive("ahk_exe code.exe"))
  esc::
  Send {left}
  alt_v_var := false
  return
  PgUp::
  send +{PgUp}
  return
  PgDn::
  send +{PgDn}
  return
  Home::
  send +{Home}
  return
  End::
  send +{End}
  return
  up::
  send +{up}
  return
  down::
  send +{down}
  return
  left::
  send +{left}
  return
  right::
  send +{right}
  return
  *w::
  alt_v_var := false
  if (GetKeyState("Shift","P")){
    send !v+w
    return
  }
  send !vw
  return
  a::
  alt_v_var := false
  send !va
  return
  i::
  alt_v_var := false
  send !vi
  return
  n::
  alt_v_var := false
  send !vn
  return
  o::
  alt_v_var := false
  send !vo
  return
  p::
  alt_v_var := false
  send !vp
  return
  l::
  alt_v_var := false
  send !vl
  return
  b::
  alt_v_var := false
  send !vb
  return
  q::
  alt_v_var := false
  send !vq
  return
  u::
  alt_v_var := false
  send !vu
  return
  r::
  alt_v_var := false
  send !vr
  return
  v::
  send !vv
  return
  h::
  alt_v_var := false
  send h
  return
  !y::
  alt_v_var := false
  send !y
  return
  !m::
  alt_v_var := false
  send !m
  return
  !s::
  alt_v_var := false
  send !s
  return
#if
