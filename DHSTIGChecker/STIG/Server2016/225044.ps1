# UNCLASSIFIED
<#
STIG:       Microsoft Windows Server 2016 Security Technical Implementation Guide :: Version 2, Release: 6 Benchmark Date: 11 May 2023
Severity:   high
Vuln ID:    V-225044
Rule ID:    SV-225044r569186_rule
STIG ID:    WN16-SO-000250
Legacy:     V-73665; SV-88329
Rule Title: Anonymous SID/Name translation must not be allowed.
Discussion:
Allowing anonymous SID/Name translation can provide sensitive information for accessing a system. Only authorized users must be able to perform such translations.


Check Content:
Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options.

If the value for "Network access: Allow anonymous SID/Name translation" is not set to "Disabled", this is a finding.

For server core installations, run the following command:

Secedit /Export /Areas SecurityPolicy /CFG C:\Path\FileName.Txt

If "LSAAnonymousNameLookup" equals "1" in the file, this is a finding.
#>

$Local:Result = Get-CurrentSecurityPolicySetting -Policy "LSAAnonymousNameLookup"

if ($Local:Result -eq 0) {
    $true
}
else {
    $false
}