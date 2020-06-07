#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.

;I made this script because I was used to a keyboard with a Context Key, RCtrl, RAlt, and RWin. Using KeyTweak, I changed my right context key to the right control key. This is required to get the "Tap for context, hold for RCtrl" functionality. I use external keyboards fairly often, and other people use my computer as well, so keys needed to mostly function as they looked like they would. This script is launched with Admin rights on every workstation logon and unlock with Task Scheduler.

;My Surface Book doesn't have RWin and RCtrl. I use these buttons a lot - the script does the following.
;AppsKey (Context) still is Context when tapped. When held with any other key, however, it transforms into the Control Key.
;RAlt + RShift = Win key, but needs to be custom mapped to each shortcut that uses it. Currently, Emoji and Lock are programmed.
;Alt+F4 is close even when Fn-Lock is off. F4 only is untouched.
;F2 (mute) is F2 in Microsoft Excel (edit cell) and File Explorer (rename), even when Fn-Lock is off.

;Read the readme at https://github.com/seaty6/MyAKHScripts/blob/master/README.md for more info.

ShortcutInUse = 0
!Volume_Up::
	Keywait, Volume_Up
	SendEvent, !{F4}
return

RCtrl & F14::Send {RWin}
RCtrl::Send {AppsKey}

RAlt & RShift::
	KeyWait, RShift
	If (ShortcutInUse == 0){
		Send ^{Esc}
	}
	else {
		sleep, 200
		ShortcutInUse = 0
	}
return

RAlt & .::
	If (GetKeyState("RShift", "P")){
		ShortcutInUse = 1
		Send #.
	}
return


RAlt & L::
	If (GetKeyState("RShift", "P")){
		ShortcutInUse = 1
		sleep, 50
		DllCall("LockWorkStation")
		sleep, 50
	}
return

#IfWinActive ahk_class CabinetWClass
Volume_Mute::F2

#IfWinActive Microsoft Excel
Volume_Mute::F2

