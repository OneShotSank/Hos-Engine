@echo off
title FNF Setup - Start
echo Make sure Haxe 4.1.5 and HaxeFlixel is installed (4.1.5 is important)!
echo Press any key to install required libraries.
pause >nul
title FNF Setup - Installing libraries
echo Installing haxelib libraries...
haxelib install lime 7.8.0
haxelib install openfl
haxelib install flixel 4.8.1
haxelib install flixel-addons
haxelib install flixel-ui
haxelib install hscript
haxelib install newgrounds
haxelib run lime setup
haxelib install flixel-tools
title FNF Setup - User action required
cls
haxelib run flixel-tools setup
cls
echo Make sure you have git installed. You can download it here: https://git-scm.com/downloads
echo Press any key to install discord rpc.
pause >nul
title FNF Setup - Installing libraries
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
cls

echo Press any key to install VS Community.
pause >nul

title Installing VS Community..
goto InstallVSCommunity

:Exit
cls
echo Setup succsefull.
echo Press any key to quit.
pause >nul
exit

:InstallVSCommunity
title FNF Setup - Installing Visual Studio Community
curl -# -O https://download.visualstudio.microsoft.com/download/pr/3105fcfe-e771-41d6-9a1c-fc971e7d03a7/8eb13958dc429a6e6f7e0d6704d43a55f18d02a253608351b6bf6723ffdaf24e/vs_Community.exe
vs_Community.exe --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows10SDK.19041 -p
goto Exit