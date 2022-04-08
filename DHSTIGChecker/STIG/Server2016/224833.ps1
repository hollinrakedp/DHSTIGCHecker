<#
Rule Title: Permissions for program file directories must conform to minimum requirements.
Severity: medium
Vuln ID: V-224833
STIG ID: WN16-00-000170

Discussion:
Changing the system's file and directory permissions allows the possibility of unauthorized and anonymous modification to the operating system and installed applications.

The default permissions are adequate when the Security Option "Network access: Let everyone permissions apply to anonymous users" is set to "Disabled" (WN16-SO-000290).

Satisfies: SRG-OS-000312-GPOS-00122, SRG-OS-000312-GPOS-00123, SRG-OS-000312-GPOS-00124


Check Content:
The default permissions are adequate when the Security Option "Network access: Let everyone permissions apply to anonymous users" is set to "Disabled" (WN16-SO-000290).

Review the permissions for the program file directories (Program Files and Program Files [x86]). Non-privileged groups such as Users or Authenticated Users must not have greater than "Read & execute" permissions. (Individual accounts must not be used to assign permissions.)

If permissions are not as restrictive as the default permissions listed below, this is a finding.

Viewing in File Explorer:

For each folder, view the Properties.

Select the "Security" tab, and the "Advanced" button.

Default permissions:
\Program Files and \Program Files (x86)
Type - "Allow" for all
Inherited from - "None" for all

Principal - Access - Applies to

TrustedInstaller - Full control - This folder and subfolders
SYSTEM - Modify - This folder only
SYSTEM - Full control - Subfolders and files only
Administrators - Modify - This folder only
Administrators - Full control - Subfolders and files only
Users - Read & execute - This folder, subfolders and files
CREATOR OWNER - Full control - Subfolders and files only
ALL APPLICATION PACKAGES - Read & execute - This folder, subfolders, and files
ALL RESTRICTED APPLICATION PACKAGES - Read & execute - This folder, subfolders, and files

Alternately, use icacls:

Open a Command prompt (admin).

Enter "icacls" followed by the directory:

'icacls "c:\program files"'
'icacls "c:\program files (x86)"'

The following results should be displayed for each when entered:

c:\program files (c:\program files (x86))
NT SERVICE\TrustedInstaller:(F)
NT SERVICE\TrustedInstaller:(CI)(IO)(F)
NT AUTHORITY\SYSTEM:(M)
NT AUTHORITY\SYSTEM:(OI)(CI)(IO)(F)
BUILTIN\Administrators:(M)
BUILTIN\Administrators:(OI)(CI)(IO)(F)
BUILTIN\Users:(RX)
BUILTIN\Users:(OI)(CI)(IO)(GR,GE)
CREATOR OWNER:(OI)(CI)(IO)(F)
APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES:(RX)
APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES:(OI)(CI)(IO)(GR,GE)
APPLICATION PACKAGE AUTHORITY\ALL RESTRICTED APPLICATION PACKAGES:(RX)
APPLICATION PACKAGE AUTHORITY\ALL RESTRICTED APPLICATION PACKAGES:(OI)(CI)(IO)(GR,GE)
Successfully processed 1 files; Failed processing 0 files

#>
return 'Not Reviewed'
