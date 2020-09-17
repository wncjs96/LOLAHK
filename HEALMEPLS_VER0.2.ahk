#SingleInstance,Force
condition:=0
SetWorkingDir, %A_ScriptDir%
Gui, front:+AlwaysOnTop
Gui, front:-Caption
Gui, front: Margin, 0,0
Gui, front:Add, Picture, x0 y0 gUImove, %A_ScriptDir%\images\titlebar.png
Gui, front:Add, Picture, x0 y40 gmain, %A_ScriptDir%\images\9684G2.png
Gui, front:Add, Picture, x0 y40 vC1,  %A_ScriptDir%\images\9684G.jpg
SoundPlay, %A_ScriptDir%\media\HEALMEPLS.wav
Gui, front: Show, xCenter y0
;sleep, 5000
GuiControl, front: Hide, C1
state := 1
return

main:
Gui Destroy
SoundPlay, nonexistent.avi
CoordMode, screen
Gui, main: Margin, 0, 0
;Gui, main:+AlwaysOnTop
;Gui, main:-AlwaysOnTop
Gui, main:-Caption
Gui, main: font, s22, Sans-Sarif

Gui, main:Add, Picture, x0 y0 gUImove, %A_ScriptDir%\images\titlebar2.png
Gui, main:Add, Picture, x0 y40, %A_ScriptDir%\images\bg.png
;Gui, main:Add,Button,x10 y100 w200 h20 grunApp, Run

Gui, main: font, cFFFFFF
Gui, main:Add, Picture, x20 y83 w110 h-1 +BackgroundTrans, %A_ScriptDir%\images\cc.png
Gui, main:Add, Text, x150 y83 +BackgroundTrans, CHOOSE ONE
;Gui, main:Add, Text, x20 y176 +BackgroundTrans, 
vkey:="w"
Gui, main:Add, DropDownList, choose1 vAbilityChoice gOnSelect, W|E|R
Gui, main:Add, Text, x320 y220 +BackgroundTrans, ACTIVATE
Gui, main:Add, Picture, x310 y250 +BackgroundTrans vy1 gClick2, %A_ScriptDir%\images\button-off-1.png
Gui, main: Add, Picture, x310 y250 +BackgroundTrans vy2 gClick2 hidden, %A_ScriptDir%\images\button-on-1.png
Gui, main:Add,BUtton,x10 y250 w200 h20 gCalibrate, CALIBRATE
Gui, main:Add,Button,x10 y300 w200 h20 gcloseApp, EXIT
Gui, main:Show, x1000 y200
return

Calibrate: 
Gui, main:+AlwaysOnTop
MsgBox, Hover your mouse over the first teammate champion's portrait, then press the SPACEBAR to get the position of the image.
KeyWait, space, D
MouseGetPos, LocX, LocY
X1 := LocX
Y1 := LocY
MsgBox, %X1% %Y1% then, move on to the next.
KeyWait, space, D
MouseGetPos, LocX, LocY
X2 := LocX
Y2 := LocY
MsgBox, %X2% %Y2% then, move on to the next.
KeyWait, space, D
MouseGetPos, LocX, LocY
X3 := LocX
Y3 := LocY
MsgBox, %X3% %Y3% then, move on to the next.
KeyWait, space, D
MouseGetPos, LocX, LocY
X4 := LocX
Y4 := LocY
MsgBox, %X4% %Y4% Done. 
Gui, main:-AlwaysOnTop
return

UImove:
PostMessage, 0xA1, 2,,, A
return

OnSelect:
GuiControlGet, AbilityChoice
;MsgBox, You entered %AbilityChoice%
if (AbilityChoice="W")
;key setup - soraka
vkey:="w"
else if (AbilityChoice = "E")
;key setup - ivern
vkey:="e"
else if (AbilityChoice = "R")
;key setup - zilean
vkey:="r"
;MsgBox, %vkey%
return

click2:
; get the winpos of the client, then calculate the relative pos of the portraits

; Better to make the calibration system. Obsolete
;WinGetPos, X, Y, Width, Height, League of Legends (TM) Client
;League of Legends (TM) Client - Name Subject to Change

;x + width, y + height -> right corner
;then subtract the right amount
;relX := Width
;relY := Height
;MsgBox, relX is %relX% relY is %relY%

GuiControl, main: Hide, y%state%
state := 3 - state
GuiControl, main: show, y%state%

;setup for the if directive
condition:=!condition

return

;;
;runApp:
;Gui, main:Add, button, x10 y100 w200 h20 gstopApp, Pause
;Gui, main:show
;setup for the if directive
;condition:=!condition
;MsgBox, %condition%
;return
;;


;stopApp:
;Gui, main:Add, button, x10 y100 w200 h20 grunApp, Run
;Gui, main:show
;return

closeApp:
ExitApp

#if condition = 1

;sleepamount = 5000
BlockInput, Mouse

$^q:: 
if (var < 1) {
var = 1
IfWinNotActive, League of 
{
	Send, {Ctrl Down}{q}{Ctrl UP}
	return
}
MouseGetPos, LocX, LocY
BlockInput, Mousemove
MouseDisabling = 1
;While GetKeyState("Control", "P") && GetKeyState("q", "P"){
	;MouseMove, A_ScreenWidth-222, A_ScreenHeight-325, 0
	;MouseMove, relX-222+((1920-Width)*0.06), relY-325+((1080-Height)*0.3), 0
	;MouseMove, 1327, 740, 0
	MouseMove, X1, Y1, 0
	SetKeyDelay, 1, -1 
	Send, %vkey%
;	Sleep, 30
;}
MouseMove, %LocX%, %LocY%, 0
BlockInput, MousemoveOff
var = 0
KeyWait, q
}
return

$^w:: 
if (var < 1) {
var=1
IfWinNotActive, League of 
{
	Send, {Ctrl Down}{w}{Ctrl UP}
	return
}
MouseGetPos, LocX, LocY
BlockInput, Mousemove
;While GetKeyState("Control", "P") && GetKeyState("w", "P"){
	;MouseMove, A_ScreenWidth-170, A_ScreenHeight-325, 0
	;MouseMove, relX-170, relY-325, 0
	MouseMove, X2, Y2, 0
	SetKeyDelay, 1, -1 
	Send, %vkey%
;	Sleep, 30
;}
MouseMove, %LocX%, %LocY%, 0
BlockInput, MousemoveOff
var = 0
KeyWait, w
}
return

$^e:: 
if (var < 1) {
var=1
IfWinNotActive, League of 
{
	Send, {Ctrl Down}{e}{Ctrl UP}
	return
}
MouseGetPos, LocX, LocY
BlockInput, Mousemove
;While GetKeyState("Control", "P") && GetKeyState("e", "P"){
	;MouseMove, A_ScreenWidth-100, A_ScreenHeight-325, 0
	;MouseMove, relX-100, relY-325, 0
	MouseMove, X3, Y3, 0
	SetKeyDelay, 1, -1 
	Send, %vkey%
;	Sleep, 30
;}
MouseMove, %LocX%, %LocY%, 0
BlockInput, MousemoveOff
var = 0
KeyWait, e
}
return

$^r:: 
if (var < 1) {
var=1
IfWinNotActive, League of 
{
	Send, {Ctrl Down}{r}{Ctrl UP}
	return
}
MouseGetPos, LocX, LocY
BlockInput, Mousemove
;While GetKeyState("Control", "P") && GetKeyState("r", "P"){
	;MouseMove, A_ScreenWidth-40, A_ScreenHeight-325, 0   
	;MouseMove, relX-40, relY-325, 0
	MouseMove, X4, Y4, 0
	SetKeyDelay, 1, -1 
	Send, %vkey%
;	Sleep, 30
;}
MouseMove, %LocX%, %LocY%, 0
BlockInput, MousemoveOff
var = 0
KeyWait, r
}
return

;$g::
;MouseMove, %LocX%, %LocY%
 ;return

$Home:: 
   IfWinNotActive, League of
      Return

   SetKeyDelay, 1, -1 ; this seems to be the fastest I can get for sending text reliably
   Send, {Enter}{Home}   GGGGGGGGGGGG    GGGGGGGGGGGG{Enter}
   Send, {Enter}{Home}   G                          G                      {Enter}
   Send, {Enter}{Home}   G                          G                      {Enter}
   Send, {Enter}{Home}   G                          G                      {Enter}
   Send, {Enter}{Home}   G    GGGGGGG       G         GGGGGG{Enter}
   Send, {Enter}{Home}   G                     G    G                     G{Enter}
   Send, {Enter}{Home}   G                     G    G                     G{Enter}
   Send, {Enter}{Home}   GGGGGGGGGGGG    GGGGGGGGGGGG{Enter}

Return

if ErrorLevel = 1
msgbox, error detected


;esc::
;exitapp
#if
