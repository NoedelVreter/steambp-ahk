#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWinDelay, 0 ; Give up performance for faster detection

START: ; Place to go back to

Process, Wait, vrmonitor.exe ; Wait for SteamVR to start

WinClose, Steam ; Close Steam(BigPicture) window

WinWait, Headset Mirror ; Wait for Headset Mirror Window
WinMaximize, Headset Mirror ; Maximize Headset Mirror

Process, WaitClose, vrmonitor.exe ; Wait for SteamVR to close
WinClose, Steam ; Close open Steam Window

Run, "steam://open/bigpicture" ; Restart Big Picture
GoTo, START ; Go back to start

