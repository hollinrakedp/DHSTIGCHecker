<#
Rule Title: Windows Server 2019 User Account Control approval mode for the built-in Administrator must be enabled.
Severity: medium
Vuln ID: V-205811
STIG ID: WN19-SO-000380

Discussion:
User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting configures the built-in Administrator account so that it runs in Admin Approval Mode.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156


Check Content:
UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2019 versus Server with Desktop Experience).

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: FilterAdministratorToken

Value Type: REG_DWORD
Value: 0x00000001 (1)

#>
return 'Not Reviewed'
