[Registry]
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Session Manager\Environment; ValueName: CLANSUITE; ValueData: {app}\xampplite\htdocs\clansuite; ValueType: expandsz; Flags: dontcreatekey uninsdeletevalue
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Session Manager\Environment; ValueName: XAMPP; ValueData: {app}\xampplite; ValueType: expandsz; Flags: dontcreatekey uninsdeletevalue
[Files]
Source: {tmp}*; DestDir: {app}; Flags: confirmoverwrite recursesubdirs ignoreversion createallsubdirs
Source: {tmp}README.txt; DestDir: {app}; Flags: isreadme
[Setup]
PrivilegesRequired=admin
OutputDir=..\
OutputBaseFilename=Clansuite-Serverpack-win32-xampp{#XVersion}
AppName=Clansuite Serverpack
AppVerName=Clansuite Serverpack v{#CVersion}
AlwaysRestart=false
ChangesEnvironment=true
DefaultDirName={drive:{pf}}\Clansuite
DirExistsWarning=yes
AllowUNCPath=false
AppPublisherURL=http://www.clansuite.com
AppSupportURL=http://forum.clansuite.com
UninstallDisplayIcon={app}\icons\Clansuite-Favicon-32.ico
UninstallDisplayName=Clansuite Serverpack v{#CVersion}
ShowLanguageDialog=no
AppID={{7454C65E-C606-40FB-8387-D34E5282664E}
SetupIconFile={#binPath}\images\Clansuite-Favicon-32.ico
MergeDuplicateFiles=false
VersionInfoVersion={#CVersion}
VersionInfoCompany=Clansuite
VersionInfoDescription=Clansuite - just an eSport CMS
VersionInfoCopyright=GPL v2 or higher
VersionInfoProductName=Clansuite - just an eSport CMS
VersionInfoProductVersion={#CVersion}
SetupLogging=true
AppCopyright=GPL v2 or higher
LicenseFile={#binPath}\LICENSE.txt
AppPublisher=Clansuite
AppUpdatesURL=http://www.clansuite.com
AppVersion={#CVersion}
AppContact=xsign.dll@gmail.com
DefaultGroupName=Clansuite
DisableProgramGroupPage=true
[Run]
Filename: {app}\Setup-Clansuite.bat; WorkingDir: {app}; Flags: waituntilterminated
Filename: {app}\Start-Clansuite.bat; Description: Run Clansuite; WorkingDir: {app}; Flags: postinstall waituntilterminated
[UninstallRun]
Filename: {app}\xampplite\xampp_stop.exe; Flags: waituntilterminated; WorkingDir: {app}\xampplite
Filename: {app}\xampplite\uninstall_xampp.bat; Parameters: auto; Flags: shellexec waituntilterminated; WorkingDir: {app}\xampplite
[UninstallDelete]
Name: {app}; Type: filesandordirs
[Icons]
Name: {userprograms}\Clansuite\Start Clansuite; Filename: {app}\Start-Clansuite.bat; WorkingDir: {app}; IconFilename: {app}\icons\Clansuite-Favicon-32.ico
Name: {userprograms}\Clansuite\Stop Clansuite; Filename: {app}\Stop-Clansuite.bat; WorkingDir: {app}; IconFilename: {app}\icons\Clansuite-Favicon-32-strikethrough.ico
Name: {userprograms}\Clansuite\Uninstall; Filename: {app}\unins000.exe; WorkingDir: {app}; IconFilename: {app}\icons\Clansuite-Favicon-32-strikethrough.ico
[Messages]
SetupWindowTitle=Setup - %1 - Enjoy!
WelcomeLabel2=[name/ver] will be installed.%n%nPlease make sure that you have no running programs that have the port 80 (http), 443 (https) or 3306 (mysql) opened.
[_ISTool]
UseAbsolutePaths=false
