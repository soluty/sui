; sui backup interface
#If WinActive("ahk_exe chrome.exe")
 or WinActive("ahk_exe firefox.exe")
 or WinActive("ahk_exe msedge.exe")
 or WinActive("ahk_exe vivaldi.exe")
 or WinActive("ahk_exe brave.exe")
^b::
ctrl_b_var_browser := true
Sleep 1000
ctrl_b_var_browser := false
return
#If (ctrl_b_var_browser)
  SUI_关闭::
  ctrl_b_var_browser := false
  Send ^{F4}
  return
  r::
  ctrl_b_var_browser := false
  Send ^{F5}
  return
#If
return
#If
