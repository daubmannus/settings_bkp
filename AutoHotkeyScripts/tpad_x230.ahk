; AutoHotkey remap for x230 keyboard

;#InstallKeybdHook
;h::KeyHistory

PrintScreen::AppsKey
;!PgUp::Home
;!PgDn::End
Home::PrintScreen
;End sends Pause
End::send {break}
^End::CtrlBreak

#PgUp:: Send, {Home}
^#PgUp::Send {Ctrl Down}{Home}{Ctrl Up}
^#+PgUp::Send {Ctrl Down}{Shift Down}{Home}{Ctrl Up}{Shift Up}
#PgDn:: Send, {End}
^#PgDn::Send {Ctrl Down}{End}{Ctrl Up}
^#+PgDn::Send {Ctrl Down}{Shift Down}{End}{Ctrl Up}{Shift Up}

; AltGr to left Alt
LControl & RAlt::Send {Alt}
RAlt::Alt
