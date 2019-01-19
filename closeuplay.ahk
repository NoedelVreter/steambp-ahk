#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Functions
isWindowFullScreen(winTitle) {
  winID := WinExist(winTitle)

  If (!winID)
    Return false

  WinGet style, Style, ahk_id %WinID%
  WinGetPos ,,,winW,winH, %winTitle%
  Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}



WinWaitActive, Steam ; Wait for Steam

START:
WinWaitNotActive, Steam ; Wait till Steam not in foreground

; Check if fullscreen and uPlay client is running
isFullScreen := isWindowFullScreen("A") 
if (isFullScreen and ProcessExist("upc.exe")) {
  WinWaitClose ; Wait till game closes
  Process,Close,upc.exe ; Close uPlay client
}

Sleep, 2000 ; Wait a while

GoTo, START ; Go back to start

