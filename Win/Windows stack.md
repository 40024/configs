- Pull latest

# OS
- Remember to re-format hard drives just in case!
- Simplewall (profile.xml on signal and E drive backups)
- Drivers
- MalwareBytes/Kaspersky (Optional)
- Debloat if not custom iso
	WPD
	OOSU10.exe
	Ameliorated scripts on website
	Simple wall
- KPXC
- Proton

# Main Prod (Sorted by prio then alphabetically)
- OneCommander
- Sifu background pic
- NVCleanstall
- Monitor to 165hz
- VSCodium
	Settings from config

- Custom cursor
- Firacode and TF2 font
- Notepad++ (Try installer first?) (with the obisidan.xml style (its also on signal))
- Notepad replacer.exe (if notepad is not removed)
- Paint.NET (Try installer first?)
- Windows powertoys (+Plugins) (+Settings restore)
- Powertoys run replace ahk script
- Powertoys run plugins
- Spotify
- Vivaldi
	settings/keyboard/
		window/ remove ctrl+shift+c bind and set it to "window/toggle dev tools"
		view/
			ctrl+shift+b to toggle bookmarks
			rm status bar keybind
		tab/
			new top level tab ctrl+t
	all panels floating
	calendar (don't skimp out, this is the most important thing in this category): meetings, 8:30 nr, 10:30 nr, 10:55-10:59 notif spam
	Extensions: UBlock jetzt Vimium Darkreader KeePassXCBrowser jetzt CanvasBlocker ClearUrls Decentraleyes UserAgentSwitcherForChrome GrammarChecker&ParaphraserLangua ViolentMonkey VideoSpeedController
	Search order: 1 DDG, 2 G, 3 Y, 4 Wikipedia, 5 Amazon, 6 ycode, 7 maps
	- Userscripts import

- Chromium zipped
- Hourglass
- JPEGView
- ManicTime (Shift day start by 5 hrs; SS S-Freeze D-SS-Visibility | Tag categories: Sleeping (6c9feb), Food (orange / yellow), Productive (00FF00) (For your own improvement), Working (3a5c2a / 9af46e)  (For money), University (e16666), Organization (blue), Solo Gaming (f1c332), Social Gaming (be9000), Entertainment (DE2EDB) (YT, Anime, Netflix), Miscellaneous (Getting up, Bathroom), Outside-Gym (9af46e / white), Idle Time (535353) (Downtime, "Social" Media), Social (pick either 00FFFF or diff color (dep family)), Family (pick either 00FFFF or diff color (dep family)), Vacation, Transit)
- Obsidian notes
- Ollama
- MPV/Potplayer (ENABLE CUSTOM ENCODER)
- Signal
- SumatraPDF (Theme: Darker; Shortcuts: Shortcuts Cmd = CmdCommandPaletteKey = Ctrl + Shift + P Cmd = CmdToggleBookmarksKey = Ctrl + T, F12)
- Systeminformer (system > options > general > enable theme support)
- Visual c++ (64 and 32) runtimes
- DOTNET SDK latest (+set DOTNET_CLI_TELEMETRY_OPTOUT=1) ( +[System.Environment]::SetEnvironmentVariable('DOTNET_CLI_TELEMETRY_OPTOUT', '1', 'User') )
- WinRar ("D:\Programs\WinRAR\WinRAR.exe" "%1" ; "D:\Programs\WinRAR\WinRAR.exe" a -r "%1.zip" "%1\*")

# Sec Prod (Sorted alphabetically)
- Registry commands (import directory-shell.reg)

- age cli
- AIP scan (+To build need jdk-19, but one in dir is already built)
- Windows Terminal (+reg cmd: "D:\Programs\Terminal\wt.exe" -d "%V")
- Volumey (+To build need dotnet-sdk-3.1.426-win-x64)
- WizTree
- ytdlp (+batch file to open wt in ./)

- Anki
- Audacity
- BalenaEtcher
- BCUninstaller
- CPUZ
- DaVinci resolve
- DDU (Display driver uninstaller)
- DBD toolkit
- Electrum wallet
- FFmpeg
- Firefox
- Firefox custom profile (user.js or new from ffprofile.com) (make sure you see decentralytes and canvas about pages)
- Fluent reader (+Import settings)
- Git (+Bash)
- Redcordbox
- KDE Connect (+Let ICMPv4* protocol through firewall) (%localappdata%/kdeconnect/config [General]; name=my-pc; customDevices=192.168.0.4,192.168.0.5,192.168.0.6;)
- Libreoffice
- Mem Reduct
- Modernflyouts (Custom built first, .msi set up as a last resort)
- Motrix
- OBS (+win-capture-audio +obs-backgroundremoval) (+ --startreplaybuffer --minimize-to-tray) (+vertical audio)
- ShareX (+Import settings)
- Smart image
- SuperF4
- Telegram
- Transmission P2P client
- Ventoy
- lively wallpaper
- WinToolkit
- printer drivers

# Coding (Sorted by Name)
- Please avoid VStudio if you can unless you desperately need it for C/C++/C#
- Setup code dirs (_Automation _Python _Web AutoHotKey, C#, C-C++, Java, Lua, SQL)

- VScodium open in registry confirm (+Computer\HKEY_CLASSES_ROOT\Directory\shell\VSCodium {make a (Default) REG_EXPAND_SZ Open w&ith VSCodium; Icon with value of "D:\PATH_TO_EXEC_HERE"; command key underneath VSCodium key with (Default) REG_EXPAND_SZ value of "D:\PATH_TO_EXEC_HERE" "%V"}; Follow cursor outline)
- VSCodium extensions
- VSCode snippets and settings
- Autohotkey v1
- Autohotkey v2
- WSL or Cygwin (wsl --install -d Ubuntu-20.04 ; requires svchost to be online)
- Docker
- Firefox dev edition
- Fivefilters
- Gradle
- get-vsix
- Imhex
- Java jdk (CAREFUL of selection!!!) (pref use temurin open source https://adoptium.net/temurin/releases/)
- Jenkins
- Jenkins-cli
- mingwInstaller (gcc g++) and cmakewn
- Chocolatey (optional) ([System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')))
- NodeJS (do NOT install choco using this menu theres too much bloat)
- nvim
- Pencil
- PGadmin
- PostgreSQL
- Pyenv win (use git clone method preferably) (alt: unzip, make .pyenv dir in userprofile, move to .pyenv, ensure bin under pyenv-win and add to system settings, add to system settings via pyenv.txt instructions)
- Python 3
- Python 2
- Sublime Merge
- Tesseract OCR
- Vbox
- Visual Studio (Only if custom firewall to block microsoft requests; Help > Privacy > Privacy Setting enable this as last resort in case data leak)
- VS buildtools

# Gaming (Sorted by Name reverse)
- Userbenchmark
- Steam
- Rivatuner
- r2modman
- Afterburner
- Kombustor
- Logitech ghub
- League
- Keyboard GK6X drivers
- four-tris (tetris)
- Epic pen
- BetterDiscord (+Plugins)
- Battlenet
- Budhud tf2

# Frivolity Niche (Can skip)
- CSLoL league skin client
- Obsidian league wad file editor
- Krita
- Try lowkey.gg install
- Nvidia experience (optional)
- League programs: (Conduit, Crescendo, Sentinel)

# Cybersecurity
- Wireshark
- Aircrack-ng
- x64dbg
- ida
- Hashcat
- Nmap

# Niche
- SDK android platform-tools adb
- HTTP Downloader
- Rainmeter
- Reaper (ableton alternative)
- Electrum wallet
- Ventoy
- Rufus
- DBD toolbox
- Blood emporium
- Cheat engine (build with lazarus from source)
- Some virutal machine (vbox?)
- MSMGtoolkit, Wintoolkit (install only if necessary, use msmgs toolkit method first, nsince msmg uses reg, after u can use wintoolkit (dism))
- Deskpins (outdated since powertoys)
- 7zip (winrar exists)
- Spicetify-Spotx (preferably only use the web version)
- Discord and BetterDiscord + USB Extensions + app.asar (but use web as main)