<#
Rule Title: Windows Server 2016 must be configured to ignore NetBIOS name release requests except from WINS servers.
Severity: low
Vuln ID: V-224919
STIG ID: WN16-CC-000070

Discussion:
Configuring the system to ignore name release requests, except from WINS servers, prevents a denial of service (DoS) attack. The DoS consists of sending a NetBIOS name release request to the server for each entry in the server's cache, causing a response delay in the normal operation of the server's WINS resolution capability.


Check Content:
If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SYSTEM\CurrentControlSet\Services\Netbt\Parameters\

Value Name:  NoNameReleaseOnDemand

Value Type:  REG_DWORD
Value:  0x00000001 (1)

#>
return 'Not Reviewed'
