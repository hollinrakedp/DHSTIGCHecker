<#
Rule Title: Windows Server 2019 Windows Remote Management (WinRM) client must not use Digest authentication.
Severity: medium
Vuln ID: V-205712
STIG ID: WN19-CC-000490

Discussion:
Digest authentication is not as strong as other options and may be subject to man-in-the-middle attacks. Disallowing Digest authentication will reduce this potential.


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowDigest

Type: REG_DWORD
Value: 0x00000000 (0)

#>
return 'Not Reviewed'
