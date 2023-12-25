; backup interface
#IfWinActive, ahk_exe Code.exe
^b::
ctrl_b_var := true
Sleep 1000
ctrl_b_var := false
return
$!v::
if(alt_v_var){
  Send !v
  return
}

alt_v_var := true
alt_vs_var := false
;Send !+v
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
  alt_vs_var := false
  CapsLock::
  Send {left}
  alt_v_var := false
  alt_vs_var := false
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
  ; alt_v_var := false
  if (GetKeyState("Shift","P")){
    send !v+w
    return
  }
  send !vw
  return
  a::
  if(!alt_vs_var){
    alt_v_var := false
    send !va
  } else {
    Send a
  }
  return
  i::
  if(!alt_vs_var){
    alt_v_var := false
    send !vi
  } else {
    Send i
  }
  return
  n::
  if(!alt_vs_var){
    alt_v_var := false
    send !vn
  } else {
    Send n
  }
  return
  o::
  if(!alt_vs_var){
    alt_v_var := false
    send !vo
  } else {
    Send o
  }
  return
  p::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !vp
  } else {
    Send p
  }
  return
  l::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !vl
  } else {
    Send l
  }
  return
  b::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !vb
  } else {
    Send b
  }
  return
  q::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !vq
  } else {
    Send q
  }
  return
  u::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !vu
  } else {
    Send u
  }
  return
  r::
  if(!alt_vs_var){
    alt_v_var := false
    send !vr
  } else {
    Send r
  }
  return
  v::
  if(!alt_vs_var){
    send !+v
  } else {
    Send v
  }
  return
  s::
  alt_vs_var := true
  send !vs
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
