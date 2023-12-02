*#w::
;WINKEY+w
ToggleWiFi()

ToggleWiFi()  {
   wmi := ComObjGet("winmgmts:")
   for adapter in wmi.ExecQuery("Select * from Win32_NetworkAdapter")
      if InStr(adapter.name, "wireless") && (interfaceName := adapter.NetConnectionID) && status := adapter.NetConnectionStatus
         break
      ; i have wireless network connection so i changed wireless to wireless network connection
   if (interfaceName = "" || status = "")  {
      MsgBox, Failed to get the interfaceName!
      return
   }
   if status not in 0,2   ; Disconnected = 0, Connected = 2
   {
      Loop  {
         Sleep, 500
         for adapter in wmi.ExecQuery("Select * from Win32_NetworkAdapter Where Index=" . adapter.Index)
            status := adapter.NetConnectionStatus
      } until status = 0 || status = 2 || (A_Index = 20 && failed := true)
      if failed  {
         MsgBox, Failed to get the status!
         return
      }
   }
   Run, % (A_IsAdmin ? "" : "*RunAs ") . "netsh.exe interface set interface name="""
                                       . interfaceName . """ admin="
                                       . (status = 0 ? "en" : "dis") . "abled",, Hide
}

return