<#
Rule Title: Early Launch Antimalware, Boot-Start Driver Initialization Policy must prevent boot drivers identified as bad.
Severity: medium
Vuln ID: V-224924
STIG ID: WN16-CC-000140

Discussion:
Compromised boot drivers can introduce malware prior to protection mechanisms that load after initialization. The Early Launch Antimalware driver can limit allowed drivers based on classifications determined by the malware protection application. At a minimum, drivers determined to be bad must not be allowed.


Check Content:
The default behavior is for Early Launch Antimalware - Boot-Start Driver Initialization policy to enforce "Good, unknown and bad but critical" (preventing "bad").

If the registry value name below does not exist, this is not a finding.

If it exists and is configured with a value of "0x00000007 (7)", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Policies\EarlyLaunch\

Value Name: DriverLoadPolicy

Value Type: REG_DWORD
Value: 0x00000001 (1), 0x00000003 (3), or 0x00000008 (8) (or if the Value Name does not exist)

Possible values for this setting are:
8 - Good only
1 - Good and unknown
3 - Good, unknown and bad but critical
7 - All (which includes "bad" and would be a finding)

#>
return 'Not Reviewed'
