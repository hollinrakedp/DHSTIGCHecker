<#
Rule Title: Windows Server 2016 must be configured to audit Detailed Tracking - Process Creation successes.
Severity: medium
Vuln ID: V-224888
STIG ID: WN16-AU-000170

Discussion:
Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Process Creation records events related to the creation of a process and the source.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000471-GPOS-00215


Check Content:
Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Detailed Tracking >> Process Creation - Success

#>
return 'Not Reviewed'
