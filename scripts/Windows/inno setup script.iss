

#define MyAppName "mediainfo-GUI"
#define MyAppVersion "2.1"
#define MyAppPublisher "hopper775"
#define MyAppURL "https://github.com/hopper775/mediainfo-GUI"
#define MyAppExeName "mediainfo-gui.exe"


  

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{62DAE1F8-FCB6-4AAE-A61F-FE3EA12C8071}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\mediainfo-GUI
UninstallDisplayIcon={app}\{#MyAppExeName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only).
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputBaseFilename=mediainfo-GUI-setup
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\vboxuser\Desktop\mediainfoGUI\dist\x86\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion; Check: not is64BitInstallMode
Source: "C:\users\vboxuser\desktop\mediainfoGUI\dist\x64\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion; Check: is64BitInstallMode

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
;Registr app
Root: HKA; Subkey: "Software\Classes\Applications\mediainfo-gui.exe\shell\open\command"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\Applications\mediainfo-gui.exe\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\mediainfo-gui.exe"" ""%1"""; Flags: uninsdeletevalue
;Add app to "Open With" menu
Root: HKA; Subkey: "Software\Classes\.mxf\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.mkv\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ogm\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.avi\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.divx\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.wmv\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.mov\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.rv\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.mpg\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.mpeg\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.mp4\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.vob\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.xvid\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.asp\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.m4v\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ogg\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.mp3\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.wav\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ra\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ac3\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.dts\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.aac\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.m4a\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.au\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.aiff\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.aif\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.opus\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.srt\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ssa\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ass\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.smi\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.jpg\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.jpeg\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.png\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.gif\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.bmp\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.tif\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.tiff\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.webp\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.heif\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.heic\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.avif\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.jxl\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.jp2\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.dds\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.tga\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.exr\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.hdr\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.psd\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.xcf\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.svg\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.ai\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\Classes\.eps\OpenWithList\mediainfo-gui.exe"; Flags: uninsdeletekeyifempty

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

