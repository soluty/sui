; sui backup interface
#If WinActive("ahk_exe chrome.exe")
^!w::
ctrl_alt_w_var := true
Sleep 1000
ctrl_alt_w_var := false
return
#If (ctrl_alt_w_var and WinActive("ahk_exe chrome.exe"))
  d::
  ctrl_alt_w_var := false
  Send ^+j
  return
#If
return
#If
