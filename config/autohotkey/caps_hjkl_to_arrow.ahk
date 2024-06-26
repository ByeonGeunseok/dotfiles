#Requires AutoHotkey v2.0.11+                               ; Always have a version requirment

*CapsLock::double_tap_caps()                                ; Double tap to use caps  

#HotIf GetKeyState('CapsLock', 'P')                         ; Following hotkeys are enabled when caps is held
h::Left
j::Down
k::Up
l::Right

y::Home
i::PgUp
u::PgDn
o::End

m::BackSpace 
,::Delete
#HotIf                                                      ; Always reset #HotIf directive when done

double_tap_caps() {
    static last := 0                                        ; Last time caps was tapped
        , threshold := 200                                  ; Speed of a double tap in ms
    if (A_TickCount - last < threshold)                     ; If time since last press is within double tap threshold
        toggle_caps()                                       ;   Toggle caps state
        ,last := 0                                          ;   Reset last to 0 (prevent triple tap from activating it again)
    else last := A_TickCount                                ; Else not a double tap, update last tap time
    return
    
    toggle_caps() {
        state := GetKeyState('CapsLock', 'T')               ; Get current caps toggle state
        SetCapsLockState('Always' (state ? 'Off' : 'On'))   ; Set it to the opposite
    }
}
