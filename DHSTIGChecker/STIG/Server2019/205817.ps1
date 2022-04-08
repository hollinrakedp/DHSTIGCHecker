<#
Rule Title: Windows Server 2019 Windows Remote Management (WinRM) service must not allow unencrypted traffic.
Severity: medium
Vuln ID: V-205817
STIG ID: WN19-CC-000510

Discussion:
Unencrypted remote access to a system can allow sensitive information to be compromised. Windows remote management connections must be encrypted to prevent this.

Satisfies: SRG-OS-000393-GPOS-00173, SRG-OS-000394-GPOS-00174


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0x00000000 (0)

#>
return 'Not Reviewed'
