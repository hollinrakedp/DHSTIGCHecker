<#
Rule Title: The Lock pages in memory user right must not be assigned to any groups or accounts.
Severity: medium
Vuln ID: V-225085
STIG ID: WN16-UR-000250

Discussion:
Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Lock pages in memory" user right allows physical memory to be assigned to processes, which could cause performance issues or a denial of service.


Check Content:
Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups are granted the "Lock pages in memory" user right, this is a finding.

For server core installations, run the following command:

Secedit /Export /Areas User_Rights /cfg c:\path\filename.txt

Review the text file.

If any SIDs are granted the "SeLockMemoryPrivilege" user right, this is a finding.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).

#>
return 'Not Reviewed'
