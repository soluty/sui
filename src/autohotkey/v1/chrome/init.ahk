; sui backup interface
#If WinActive("ahk_exe chrome.exe")
^!SUI_窗口::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
RCtrl & SUI_窗口::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
AppsKey & SUI_窗口::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
!SUI_打开::
alt_l_var := true
Send !SUI_打开
Sleep 1000
alt_l_var := false
return
#If

#If (ctrl_alt_w_var and WinActive("ahk_exe chrome.exe"))
  d::
  ctrl_alt_w_var := false
  Send ^+j
  return
  Left::
  ctrl_alt_w_var := false
  Send !{F8}
  return
  Right::
  ctrl_alt_w_var := false
  Send !{F9}
  return
#If

#If (alt_l_var and WinActive("ahk_exe chrome.exe"))
  SUI_句号::
  Send ^+p
  return
#If