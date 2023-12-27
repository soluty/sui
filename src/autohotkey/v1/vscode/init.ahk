; backup interface
#IfWinActive, ahk_exe Code.exe
^SUI_备份::
ctrl_b_var := true
Sleep 1000
ctrl_b_var := false
return
$!SUI_选择模式::
if(alt_v_var){
  Send !SUI_选择模式
  return
}

alt_v_var := true
alt_vs_var := false
;Send !+v
return

RCtrl::Alt
AppsKey::Alt

!*SUI_大小::
if (GetKeyState("Shift","P")){
  alt_s_var := true
  return
}
alt_s_var := false
;alt_xiaos_var := true
Send !SUI_大小
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
  SUI_小上::
  Send !+SUI_大小SUI_小上
  return
  SUI_小下::
  Send !+SUI_大小SUI_小下
  return
  SUI_小左::
  Send !+SUI_大小SUI_小左
  return
  SUI_小右::
  Send !+SUI_大小SUI_小右
  return
  u::
  Send !+SUI_大小u
  return
  d::
  Send !+SUI_大小d
  return
  s::
  Send !+SUI_大小s
  return
  m::
  alt_s_var := false
  Send !+SUI_大小m
  return
  z::
  alt_s_var := false
  Send !+SUI_大小z
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
  *SUI_窗口::
  ; alt_v_var := false
  if (GetKeyState("Shift","P")){
    send !SUI_选择模式+SUI_窗口
    return
  }
  send !SUI_选择模式SUI_窗口
  return
  SUI_对象外部::
  if(!alt_vs_var){
    alt_v_var := false
    send !SUI_选择模式SUI_对象外部
  } else {
    Send SUI_对象外部
  }
  return
  SUI_对象内部::
  if(!alt_vs_var){
    alt_v_var := false
    send !SUI_选择模式SUI_对象内部
  } else {
    Send SUI_对象内部
  }
  return
  SUI_小左::
  if(!alt_vs_var){
    alt_v_var := false
    send !SUI_选择模式SUI_小左
  } else {
    Send SUI_小左
  }
  return
  SUI_小右::
  if(!alt_vs_var){
    alt_v_var := false
    send !SUI_选择模式SUI_小右
  } else {
    Send SUI_小右
  }
  return
  SUI_粘贴::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !SUI_选择模式SUI_粘贴
  } else {
    Send SUI_粘贴
  }
  return
  SUI_打开::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !SUI_选择模式SUI_打开
  } else {
    Send SUI_打开
  }
  return
  SUI_备份::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !SUI_选择模式SUI_备份
  } else {
    Send SUI_备份
  }
  return
  SUI_关闭::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !SUI_选择模式SUI_关闭
  } else {
    Send SUI_关闭
  }
  return
  e::
  if(!alt_vs_var){
    ; alt_v_var := false
    send !SUI_选择模式e
  } else {
    Send e
  }
  return
  SUI_对象两边::
  if(!alt_vs_var){
    alt_v_var := false
    send !SUI_选择模式SUI_对象两边
  } else {
    Send SUI_对象两边
  }
  return
  SUI_选择模式::
  if(!alt_vs_var){
    send !+SUI_选择模式
  } else {
    Send SUI_选择模式
  }
  return
  SUI_大小::
  alt_vs_var := true
  send !SUI_选择模式SUI_大小
  return
  !SUI_拷贝::
  alt_v_var := false
  send !SUI_拷贝
  return
  !SUI_移动::
  alt_v_var := false
  send !SUI_移动
  return
  !SUI_大小::
  alt_v_var := false
  send !SUI_大小
  return
#if
