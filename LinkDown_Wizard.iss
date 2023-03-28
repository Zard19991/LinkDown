; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "LinkDown"
#define MyAppVersion "0.1.1"
#define MyAppPublisher "LinkScape"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{071FA4AD-9CA3-45A4-95D1-C01A7D21C246}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.\
OutputBaseFilename=linkdown_setup
SetupIconFile=LinkDown.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
ChangesEnvironment=true

[Tasks]
Name: modifypath; Description: Add LinkDown to PATH; Flags: checkablealone

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimplified"; MessagesFile: "{src}\Languages\ChineseSimplified.isl"

[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'user';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;
#include "modpath.iss"

[Files]
Source: "LinkDown\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ContextSearch-webext\*"; DestDir: "{userappdata}\ContextSearch-webext"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKCR; Subkey: "Software\Mozilla\NativeMessagingHosts\contextsearch_webext"; ValueType: String; ValueData: "{userappdata}\ContextSearch-webext\Firefox\contextsearch_webext.json"; MinVersion: 0.0,6.0;
Root: HKCR; Subkey: "Software\Google\Chrome\NativeMessagingHosts\contextsearch_webext"; ValueType: String; ValueData: "{userappdata}\ContextSearch-webext\Chrome\contextsearch_webext.json"; MinVersion: 0.0,6.0;
