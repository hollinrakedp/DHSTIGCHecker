# UNCLASSIFIED
<#
STIG:       Microsoft Windows Server 2019 Security Technical Implementation Guide :: Version 2, Release: 6 Benchmark Date: 11 May 2023
Severity:   medium
Vuln ID:    V-205754
Rule ID:    SV-205754r877392_rule
STIG ID:    WN19-UR-000070
Legacy:     V-93059; SV-103147
Rule Title: Windows Server 2019 Create global objects user right must only be assigned to Administrators, Service, Local Service, and Network Service.
Discussion:
Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create global objects" user right can create objects that are available to all sessions, which could affect processes in other users' sessions.


Check Content:
Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create global objects" user right, this is a finding:

- Administrators
- Service
- Local Service
- Network Service

For server core installations, run the following command:

Secedit /Export /Areas User_Rights /cfg c:\path\filename.txt

Review the text file.

If any SIDs other than the following are granted the "SeCreateGlobalPrivilege" user right, this is a finding:

S-1-5-32-544 (Administrators)
S-1-5-6 (Service)
S-1-5-19 (Local Service)
S-1-5-20 (Network Service)

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN19-00-000050) and required frequency of changes (WN19-00-000060).
#>

$GrantedPrivilege = ($Script:CurrentSecPolicy.SeCreateGlobalPrivilege -split ',').trimstart('*')

$Allowed = @($Script:SIDLocalGroup.Administrators,
$Script:SIDLocalGroup.LocalService,
$Script:SIDLocalGroup.NetworkService
$Script:SIDLocalGroup.Service)

$Local:Results = @()

foreach ($ID in $GrantedPrivilege) {
    $Local:Results += if ($Allowed -contains $ID ) {
        $true
    }
    else {
        $false
    }
}

if ($Local:Results -contains $false) {
    $false
}
else {
    $true
}