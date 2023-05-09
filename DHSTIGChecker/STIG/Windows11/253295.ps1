<#
STIG:       Microsoft Windows 11 Security Technical Implementation Guide :: Version 1, Release: 2 Benchmark Date: 14 Nov 2022
Severity:   medium
Vuln ID:    V-253295
Rule ID:    SV-253295r828969_rule
STIG ID:    WN11-00-000250
Legacy:     
Rule Title: Windows 11 non-persistent VM sessions must not exceed 24 hours.
Discussion:
For virtual desktop implementations (VDIs) where the virtual desktop instance is deleted or refreshed upon logoff, the organization must enforce that sessions be terminated within 24 hours. This would ensure any data stored on the VM that is not encrypted or covered by Credential Guard is deleted.


Check Content:
Ensure there is a documented policy or procedure in place that non-persistent VM sessions do not exceed 24 hours.

If there is no such documented policy or procedure in place, this is a finding.
#>

# MANUAL
return 'Not Reviewed'
