;provided to you by ClockworkIgor

;alt+shift+t
;!!! THIS SCRIPT WORKS ANYWHERE IN FILE EXPLORER BUT ON THE DESKTOP!!!
!+t:: 
Send, {F4} ;get to the textbox that contains the current path
Send, ^a ;select current path
Sleep, 100 ;wait time was required coz selection would be skipped before the next command
Send, ^c
Sleep, 100 ;required coz somehow the clipboard doesnt get instantly updated and the old value would still be present


;MsgBox % Format(" {1} ", Clipboard)
InputBox, varb, Create Text,Input file name,show,150,130 ;name your file
Clipboard := Clipboard "\" 

Sleep, 100
vara := Clipboard varb ;some string concatentations
;MsgBox % Format(" {1} ", vara)
Run, Notepad %vara%.txt ;change extension to make word docs or other files
Sleep, 100
Send, {enter}

;DRAWBACKS OR THINGS TO PAY ATTENTION TO:
; 1) this script will NOT run on the desktop if it's not open inside an Explorer file
; 2) !!!THIS SCRIPT WILL ALTER the contents of your clipboard. - it's good to have the clipboard history activated
; this way, you can use win+V to see older things you had in your clipboard. 
; google it for more info and if your OS supports clipboard history

;ADAPTATIONS: 
; 1) can be used to create word docs or other stuff only by changing the extension of the file created 
; into an extension that's bound to another program (e.g. docx that's bound to Microsoft Word)
; 2) can add an ALT+F4 at the end to close the file that Notepad normally opens

;daca vrei docx, da-i alt+f4 dupa un sleep,100 
;dupa enter
;dupa open with word gen WINWORD.EXE %var%.docx
return




;scriptul asta imi face aproape ce vreau, dar daca deja exista fisierul numit in X fel, imi va scrie IN el.
;avantaj, scriptul asta imi si deschide notepadul.
;TODO verifica daca exista deja ceva cu un anumit nume in folderul curent, fa un while (exists) increment
;cand iesi din while, appenduiesti variabila aia la numele din %var%

;celelalte scripturi fac ce vreau, DAR 
;dezavantaje: 1) trebuie sa am mausu in fereastra unde vreau fisier nou!!
;2) functioneaza DOAR daca nu am niciun fisier deja selectat - nu pot deselecta fisiere - solutie: CTRL+SPACE before
;3) in functie de ce aplicatii mai instalez va trebui sa le modific, ca poate mai apar aplicatuu cu M sau N in context menu
;4) e neplacuta estetic pentru ca imi apare context menu ca si cand as da click dreapta.