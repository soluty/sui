; sui backup interface
#If WinActive("ahk_exe chrome.exe")
^!w::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
RCtrl & w::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
AppsKey & w::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
!l::
alt_l_var := true
Send !l
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
  .::
  Send ^+p
  return
#If