<#
STIG:       Microsoft Windows Server 2019 Security Technical Implementation Guide :: Version 2, Release: 5 Benchmark Date: 14 Nov 2022
Severity:   high
Vuln ID:    V-205743
Rule ID:    SV-205743r852444_rule
STIG ID:    WN19-DC-000110
Legacy:     V-93037; SV-103125
Rule Title: Windows Server 2019 organization created Active Directory Organizational Unit (OU) objects must have proper access control permissions.
Discussion:
When directory service database objects do not have appropriate access control permissions, it may be possible for malicious users to create, read, update, or delete the objects and degrade or destroy the integrity of the data. When the directory service is used for identification, authentication, or authorization functions, a compromise of the database objects could lead to a compromise of all systems that rely on the directory service.

For Active Directory, the OU objects require special attention. In a distributed administration model (i.e., help desk), OU objects are more likely to have access permissions changed from the secure defaults. If inappropriate access permissions are defined for OU objects, it could allow an intruder to add or delete users in the OU. This could result in unauthorized access to data or a denial of service (DoS) to authorized users.


Check Content:
This applies to domain controllers. It is NA for other systems.

Review the permissions on domain-defined OUs.

Open "Active Directory Users and Computers" (available from various menus or run "dsa.msc").

Ensure "Advanced Features" is selected in the "View" menu.

For each OU that is defined (folder in folder icon) excluding the Domain Controllers OU:

Right-click the OU and select "Properties".

Select the "Security" tab.

If the Allow type permissions on the OU are not at least as restrictive as those below, this is a finding.

The permissions shown are at the summary level. More detailed permissions can be viewed by selecting the "Advanced" button, the desired Permission entry, and the "Edit" or "View" button.

Except where noted otherwise, the special permissions may include a wide range of permissions and properties and are acceptable for this requirement.

CREATOR OWNER - Special permissions

Self - Special permissions

Authenticated Users - Read, Special permissions

The Special permissions for Authenticated Users are Read type. If detailed permissions include any Create, Delete, Modify, or Write Permissions or Properties, this is a finding.

SYSTEM - Full Control

Domain Admins - Full Control

Enterprise Admins - Full Control

Key Admins - Special permissions

Enterprise Key Admins - Special permissions

Administrators - Read, Write, Create all child objects, Generate resultant set of policy (logging), Generate resultant set of policy (planning), Special permissions

Pre-Windows 2000 Compatible Access - Special permissions

The Special permissions for Pre-Windows 2000 Compatible Access are for Read types. If detailed permissions include any Create, Delete, Modify, or Write Permissions or Properties, this is a finding.

ENTERPRISE DOMAIN CONTROLLERS - Read, Special permissions

If an ISSO-approved distributed administration model (help desk or other user support staff) is implemented, permissions above Read may be allowed for groups documented by the ISSO.

If any OU with improper permissions includes identification or authentication data (e.g., accounts, passwords, or password hash data) used by systems to determine access control, the severity is CAT I (e.g., OUs that include user accounts, including service/application accounts).

If an OU with improper permissions does not include identification and authentication data used by systems to determine access control, the severity is CAT II (e.g., Workstation, Printer OUs).
#>

# PARTIAL
if ($Script:IsDomainController) {
    "Not Reviewed"
}
else {
    "Not Applicable"
}