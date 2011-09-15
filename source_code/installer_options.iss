#define AppVer "0.2.0"
#define AppName "Screen Capture Recorder Device"

[UninstallRun]
Filename: regsvr32; WorkingDir: {app}; Parameters: /s /u PushDesktop.ax
[Run]
Filename: regsvr32; WorkingDir: {app}; Parameters: /s PushDesktop.ax
[Files]
Source: Release\PushDesktop.ax; DestDir: {app}
Source: ..\README.TXT; DestDir: {app}; Flags: isreadme
Source: ..\configuration_setup_utility\*.*; DestDir: {app}\configuration_setup_utility; Flags: recursesubdirs
Source: ..\troubleshooting_benchmarker\BltTest\Release\BltTest.exe; DestDir: {app}

[Setup]
AppName={#AppName}
AppVerName={#AppVer}
DefaultDirName={pf}\{#AppName}
DefaultGroupName={#AppName}
UninstallDisplayName={#AppName} uninstall
OutputBaseFilename=setup {#AppName} v{#AppVer}
[Icons]
Name: {group}\_record screen using current settings for a specific number of seconds; Filename: java; WorkingDir: {app}\configuration_setup_utility; Parameters: -jar jruby-complete-1.6.4.jar timed_recording.rb
Name: {group}\configure by setting numbers; Filename: {app}\configuration_setup_utility\edit_config.bat; WorkingDir: {app}\configuration_setup_utility
Name: {group}\benchmark your screen capture speeds; Filename: {app}\BltTest.exe; WorkingDir: {app}
Name: {group}\configure by resizing a window; Filename: javaw; WorkingDir: {app}\configuration_setup_utility; Parameters: -jar jruby-complete-1.6.4.jar window_resize.rb
Name: {group}\Uninstall; Filename: {uninstallexe}
