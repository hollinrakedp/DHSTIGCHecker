# UNCLASSIFIED
<#
STIG:       Microsoft Windows Server 2016 Security Technical Implementation Guide :: Version 2, Release: 6 Benchmark Date: 11 May 2023
Severity:   medium
Vuln ID:    V-224984
Rule ID:    SV-224984r852356_rule
STIG ID:    WN16-DC-000210
Legacy:     V-73397; SV-88049
Rule Title: The Active Directory AdminSDHolder object must be configured with proper audit settings.
Discussion:
When inappropriate audit settings are configured for directory service database objects, it may be possible for a user or process to update the data without generating any tracking data. The impact of missing audit data is related to the type of object. A failure to capture audit data for objects used by identification, authentication, or authorization functions could degrade or eliminate the ability to track changes to access policy for systems or data. 

For Active Directory (AD), there are a number of critical object types in the domain naming context of the AD database for which auditing is essential. This includes the AdminSDHolder object. Because changes to these objects can significantly impact access controls or the availability of systems, the absence of auditing data makes it impossible to identify the source of changes that impact the confidentiality, integrity, and availability of data and systems throughout an AD domain. The lack of proper auditing can result in insufficient forensic evidence needed to investigate an incident and prosecute the intruder.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212


Check Content:
This applies to domain controllers. It is NA for other systems.

Review the auditing configuration for the "AdminSDHolder" object.

Open "Active Directory Users and Computers" (available from various menus or run "dsa.msc").

Ensure "Advanced Features" is selected in the "View" menu.

Select "System" under the domain being reviewed in the left pane.

Right-click the "AdminSDHolder" object in the right pane and select "Properties".

Select the "Security" tab.

Select the "Advanced" button and then the "Auditing" tab.

If the audit settings on the "AdminSDHolder" object are not at least as inclusive as those below, this is a finding.

Type - Fail
Principal - Everyone
Access - Full Control
Inherited from - None
Applies to - This object only

The success types listed below are defaults. Where Special is listed in the summary screens for Access, detailed Permissions are provided for reference. Various Properties selections may also exist by default.

Type - Success
Principal - Everyone
Access - Special
Inherited from - None
Applies to - This object only
(Access - Special = Write all properties, Modify permissions, Modify owner)

Two instances with the following summary information will be listed.

Type - Success
Principal - Everyone
Access - (blank)
Inherited from - (CN of domain)
Applies to - Descendant Organizational Unit objects
#>

# PARTIAL
if ($Script:IsDomainController) {
    "Not Reviewed"
}
else {
    "Not Applicable"
}