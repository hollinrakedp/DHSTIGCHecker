# UNCLASSIFIED
<#
STIG:       Microsoft Windows Server 2019 Security Technical Implementation Guide :: Version 2, Release: 6 Benchmark Date: 11 May 2023
Severity:   high
Vuln ID:    V-205750
Rule ID:    SV-205750r877392_rule
STIG ID:    WN19-UR-000020
Legacy:     V-93051; SV-103139
Rule Title: Windows Server 2019 Act as part of the operating system user right must not be assigned to any groups or accounts.
Discussion:
Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that the user is authorized to access. Any accounts with this right can take complete control of a system.


Check Content:
Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups (to include administrators), are granted the "Act as part of the operating system" user right, this is a finding.

For server core installations, run the following command:

Secedit /Export /Areas User_Rights /cfg c:\path\filename.txt

Review the text file.

If any SIDs are granted the "SeTcbPrivilege" user right, this is a finding.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN19-00-000050) and required frequency of changes (WN19-00-000060).

Passwords for accounts with this user right must be protected as highly privileged accounts.
#>

$GrantedPrivilege = ($Script:CurrentSecPolicy.SeTcbPrivilege -split ',').trimstart('*')

if ($null -eq $GrantedPrivilege) {
    $true
}
else {
    $false
}