<#
STIG:       Microsoft Windows 11 Security Technical Implementation Guide :: Version 1, Release: 2 Benchmark Date: 14 Nov 2022
Severity:   medium
Vuln ID:    V-253320
Rule ID:    SV-253320r829044_rule
STIG ID:    WN11-AU-000082
Legacy:     
Rule Title: Windows 11 must be configured to audit Object Access - File Share successes.
Discussion:
Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Auditing file shares records events related to connection to shares on a system including system shares such as C$.


Check Content:
Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN11-SO-000030) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open PowerShell or a Command Prompt with elevated privileges ("Run as Administrator").
Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following:

Object Access >> File Share - Success

If the system does not audit the above, this is a finding.
#>

$Local:Category = "File Share"
$Local:Setting = "Success"

$Local:AuditSetting = $Script:AuditPolicy | Where-Object {$_.Subcategory -contains "$Local:Category"}

if ($Local:AuditSetting.'Inclusion Setting' -match $Local:Setting) {
    $true
}
else {
    $false
}