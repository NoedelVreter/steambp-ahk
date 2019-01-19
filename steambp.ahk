#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SetWinDelay, 0 ; Give up performance for faster detection

MouseMove, %A_ScreenWidth%,1 ; Hide the mouse in the corner

Gui, Color, black ; Create a black window
Gui +AlwaysOnTop ; Make it always on-top
Gui -Caption ; Make it borderless
Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight% ; And show it fullscreen

Run, steamvr.exe,,Hide ; Run steamvr script
Run, closeuplay.exe,,Hide ; Run Close uPlay script

Run, nircmd.exe setdefaultsounddevice "SAMSUNG-0",,Hide ; Set default sound device

Run, "C:\Program Files (x86)\Steam\steam.exe" -bigpicture -steamos -fulldesktopres ; Run steam with big picture UI

WinWait, Steam ahk_class CUIEngineWin32 ; Wait for BigPicture

Gui, Destroy ; Remove black window

WinActivate, Steam ; Make Steam take foreground

ExitApp ; Exit this script