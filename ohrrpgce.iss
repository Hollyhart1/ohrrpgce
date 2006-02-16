; This script is used by Inno Setup to create a Windows Installer.
; see http://www.jrsoftware.org/isinfo.php to download Inno Setup

[Setup]
AppName=Official Hamster Republic RPG Construction Engine
#include "iver.txt"
AppPublisher=Hamster Republic Productions
AppPublisherURL=http://HamsterRepublic.com/ohrrpgce/
AppSupportURL=http://HamsterRepublic.com/ohrrpgce/docs.php
AppUpdatesURL=http://HamsterRepublic.com/ohrrpgce/download.php
AppReadmeFile={app}\README-custom.txt
DefaultDirName=\OHRRPGCE
DefaultGroupName=OHRRPGCE
DisableProgramGroupPage=yes
AllowNoIcons=yes
AllowUNCPath=no
LicenseFile=LICENSE-binary.txt
InfoAfterFile=whatsnew.txt
OutputBaseFilename=ohrrpgce
Compression=bzip
SolidCompression=yes
ChangesAssociations=yes
UninstallDisplayIcon={app}\game.ico

[Languages]
Name: "eng"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"
Name: "associate"; Description: "{cm:AssocFileExtension,GAME.EXE,RPG}"

[Files]
Source: "game.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "custom.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "game-qb.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "customqb.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "hspeak.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "unlump.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ohrrpgce.fnt"; DestDir: "{app}"; Flags: ignoreversion
Source: "ohrrpgce.mas"; DestDir: "{app}"; Flags: ignoreversion
Source: "ohrrpgce.new"; DestDir: "{app}"; Flags: ignoreversion
Source: "game.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "README-game.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "README-custom.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "LICENSE-binary.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "whatsnew.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "sample\sample.rpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "sample\npc_tag.rpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "sample\pstutor.rpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "plotscr.hsd"; DestDir: "{app}"; Flags: ignoreversion
Source: "scancode.hsi"; DestDir: "{app}"; Flags: ignoreversion
Source: "import\*"; DestDir: "{app}\import\"; Flags: ignoreversion
Source: "docs\*"; DestDir: "{app}\docs\"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\OHRRPGCE Game Player"; Filename: "{app}\game.exe"; WorkingDir: "{app}"; Flags: closeonexit
Name: "{userdesktop}\OHRRPGCE Game Player"; Filename: "{app}\game.exe"; WorkingDir: "{app}"; Flags: closeonexit; Tasks: desktopicon
Name: "{group}\OHRRPGCE Custom Editor"; Filename: "{app}\custom.exe"; WorkingDir: "{app}"; Flags: closeonexit
Name: "{userdesktop}\OHRRPGCE Custom Editor"; Filename: "{app}\custom.exe"; WorkingDir: "{app}"; Flags: closeonexit; Tasks: desktopicon
Name: "{userdesktop}\OHRRPGCE Folder (install games here)"; Filename: "{app}"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{group}\Website (Help, HOWTO, FAQ)"; Filename: "http://HamsterRepublic.com/ohrrpgce/";
Name: "{group}\Download RPG Games"; Filename: "http://HamsterRepublic.com/ohrrpgce/index.php/Games.html";

[Registry]
Root: HKCR; Subkey: ".rpg"; ValueType: string; ValueName: ""; ValueData: "OHRRPGCE_Game"; Flags: uninsdeletevalue; Tasks: associate
Root: HKCR; Subkey: "OHRRPGCE_Game"; ValueType: string; ValueName: ""; ValueData: "OHRRPGCE Game"; Flags: uninsdeletekey; Tasks: associate
Root: HKCR; Subkey: "OHRRPGCE_Game\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\game.ico"; Tasks: associate
Root: HKCR; Subkey: "OHRRPGCE_Game\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\game.exe"" %1"; Tasks: associate

[Run]

