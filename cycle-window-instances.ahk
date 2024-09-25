!Shift::
; *#Shift ; was win+shift
; alt+Shift is the hotkey to cycle through windows of the same application

    WinGet, id, list, % "ahk_class " WinGetClass("A")
    If id = 1
        return

    WinGet, active_id, ID, A
    Loop, %id%
    {
        this_ID := id%A_Index%
        If (this_ID = active_id)
        {
            next_index := Mod(A_Index, id) + 1
            next_id := id%next_index%
            WinActivate, ahk_id %next_id%
            break
        }
    }
return

WinGetClass(winTitle="A")
{
    WinGetClass, winClass, %winTitle%
    return winClass
}
