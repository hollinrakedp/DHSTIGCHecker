<#
STIG:       Microsoft Windows 11 Security Technical Implementation Guide :: Version 1, Release: 2 Benchmark Date: 14 Nov 2022
Severity:   medium
Vuln ID:    V-253457
Rule ID:    SV-253457r829455_rule
STIG ID:    WN11-SO-000167
Legacy:     
Rule Title: Remote calls to the Security Account Manager (SAM) must be restricted to Administrators.
Discussion:
The Windows Security Account Manager (SAM) stores users' passwords. Restricting remote rpc connections to the SAM to Administrators helps protect those credentials.


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: RestrictRemoteSAM

Value Type: REG_SZ
Value: O:BAG:BAD:(A;;RC;;;BA)
#>

$Params = @{
    Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\"
    Name          = "RestrictRemoteSAM"
    ExpectedValue = "O:BAG:BAD:(A;;RC;;;BA)"
}

Compare-RegKeyValue @Params