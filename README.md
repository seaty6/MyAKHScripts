
# MyAKHScripts
AutoHotKey scripts that I use - published in case someone else would like to use them.

SurfaceBook3.akh
-
 I made this script because I was used to a keyboard with a Context Key, RCtrl, RAlt, and RWin. Using KeyTweak, I changed my right context key to the right control key. This is required to get the "Tap for context, hold for RCtrl" functionality.
I use external keyboards fairly often, and other people use my computer as well, so keys needed to mostly function as they looked like they would.
This script is launched with Admin rights on every workstation logon and unlock with Task Scheduler.
- My Surface Book doesn't have RWin and RCtrl. I use these buttons a lot - the script does the following.
- AppsKey (Context) still is Context when tapped. When held with any other key, however, it transforms into the Control Key.
- RAlt + RShift = Win key, but needs to be custom mapped to each shortcut that uses it. 
	Currently, Emoji and Lock are programmed.  
- Alt+F4 is close even when Fn-Lock is off. F4 only is untouched.
- F2 (mute) is F2 in Microsoft Excel (edit cell) and File Explorer (rename), even when Fn-Lock is off.

Using Sharpkey/keytweak, I changed my right context key to the right control key.
The reason why I'm using AHK and the mappings that I'm using is because I use external keyboards fairly frequently, and can't have confusing mappings. 
This script is launched with Admin rights on every workstation logon and unlock with Task Scheduler. You can use [this Task Scheduler Guide](http://forum.notebookreview.com/threads/the-throttlestop-guide.531329/#post-6865107) to start as Administrator so the remappings work in elevated applications as well. 
