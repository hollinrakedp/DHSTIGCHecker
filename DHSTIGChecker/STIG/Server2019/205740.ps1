<#
STIG:       Microsoft Windows Server 2019 Security Technical Implementation Guide :: Version 2, Release: 5 Benchmark Date: 14 Nov 2022
Severity:   high
Vuln ID:    V-205740
Rule ID:    SV-205740r852441_rule
STIG ID:    WN19-DC-000080
Legacy:     V-93031; SV-103119
Rule Title: Windows Server 2019 Active Directory SYSVOL directory must have the proper access control permissions.
Discussion:
Improper access permissions for directory data files could allow unauthorized users to read, modify, or delete directory data.

The SYSVOL directory contains public files (to the domain) such as policies and logon scripts. Data in shared subdirectories are replicated to all domain controllers in a domain.


Check Content:
This applies to domain controllers. It is NA for other systems.

Open a command prompt.

Run "net share".

Make note of the directory location of the SYSVOL share.

By default, this will be \Windows\SYSVOL\sysvol. For this requirement, permissions will be verified at the first SYSVOL directory level.

If any standard user accounts or groups have greater than "Read & execute" permissions, this is a finding. 

The default permissions noted below meet this requirement:

Open "Command Prompt".

Run "icacls c:\Windows\SYSVOL".

The following results should be displayed:

NT AUTHORITY\Authenticated Users:(RX)
NT AUTHORITY\Authenticated Users:(OI)(CI)(IO)(GR,GE)
BUILTIN\Server Operators:(RX)
BUILTIN\Server Operators:(OI)(CI)(IO)(GR,GE)
BUILTIN\Administrators:(M,WDAC,WO)
BUILTIN\Administrators:(OI)(CI)(IO)(F)
NT AUTHORITY\SYSTEM:(F)
NT AUTHORITY\SYSTEM:(OI)(CI)(IO)(F)
CREATOR OWNER:(OI)(CI)(IO)(F)

(RX) - Read & execute 

Run "icacls /help" to view definitions of other permission codes.
#>

# PARTIAL
if ($Script:IsDomainController) {
    "Not Reviewed"
}
else {
    "Not Applicable"
}