!F8::
;ALT+F8
;To find which device number is the microphone:
; 1) go to sound settings and adjust volume to something very specific like 69
; 2) run the AutoHotKey script SoundCardAnalysis that is provided with AHK.
; 3) change varb to the index that's near the volume you set. 
; 4) If it works, the microphone volume should toggle between 0 and 91.

varb=24
;varb=16	;sound device number for microphone
;varb=5	;sound device number for microphone
SoundGet, var, MASTER, VOL, %varb%
if var not between -1 and 1
	SoundSet, 0, MASTER, VOL, %varb%
if var between -1 and 1
	SoundSet, 91, MASTER, VOL, %varb%
SoundGet, var, MASTER, VOL, %varb%
MsgBox % Format("Mic vol set to = {1} ", var)
return
;alt+F8
;4 = boxe sau microfon uneori
;13 microfon (old)
;12 microfon (old)
;16 uneori
;mai poate fi si 15 sau 19 sau 16
;dupa restart mic = 12 WTF... check if this is due to connecting other devices i.e. bluetooth headphones etc
;sau pentru ca am dat disable la audio de la monitoru Fujitsu

;add this to all scripts if u want to pause them
;^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.