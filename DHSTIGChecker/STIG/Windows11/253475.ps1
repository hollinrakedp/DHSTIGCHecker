# UNCLASSIFIED
<#
STIG:       Microsoft Windows 11 Security Technical Implementation Guide :: Version 1, Release: 3 Benchmark Date: 11 May 2023
Severity:   medium
Vuln ID:    V-253475
Rule ID:    SV-253475r829509_rule
STIG ID:    WN11-SO-000275
Legacy:     
Rule Title: User Account Control must virtualize file and registry write failures to per-user locations.
Discussion:
User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting configures non-UAC compliant applications to run in virtualized file and registry entries in per-user locations, allowing them to run.


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableVirtualization

Value Type: REG_DWORD
Value: 1
#>

$Params = @{
    Path          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\"
    Name          = "EnableVirtualization"
    ExpectedValue = 1
}

Compare-RegKeyValue @Params