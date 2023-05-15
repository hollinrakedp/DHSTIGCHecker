# UNCLASSIFIED
<#
STIG:       Microsoft Windows Server 2016 Security Technical Implementation Guide :: Version 2, Release: 6 Benchmark Date: 11 May 2023
Severity:   high
Vuln ID:    V-224961
Rule ID:    SV-224961r877395_rule
STIG ID:    WN16-CC-000530
Legacy:     V-73599; SV-88263
Rule Title: The Windows Remote Management (WinRM) service must not use Basic authentication.
Discussion:
Basic authentication uses plain-text passwords that could be used to compromise a system. Disabling Basic authentication will reduce this potential.


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0x00000000 (0)
#>

$Params = @{
    Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\"
    Name          = "AllowBasic"
    ExpectedValue = 0
}

Compare-RegKeyValue @Params