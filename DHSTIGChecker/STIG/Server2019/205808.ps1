<#
Rule Title: Windows Server 2019 must not save passwords in the Remote Desktop Client.
Severity: medium
Vuln ID: V-205808
STIG ID: WN19-CC-000340

Discussion:
Saving passwords in the Remote Desktop Client could allow an unauthorized user to establish a remote desktop session to another system. The system must be configured to prevent users from saving passwords in the Remote Desktop Client.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: DisablePasswordSaving

Type: REG_DWORD
Value: 0x00000001 (1)

#>
return 'Not Reviewed'
