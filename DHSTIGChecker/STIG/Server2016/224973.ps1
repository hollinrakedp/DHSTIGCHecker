<#
Rule Title: The Active Directory Domain Controllers Organizational Unit (OU) object must have the proper access control permissions.
Severity: high
Vuln ID: V-224973
STIG ID: WN16-DC-000100

Discussion:
When Active Directory objects do not have appropriate access control permissions, it may be possible for malicious users to create, read, update, or delete the objects and degrade or destroy the integrity of the data. When the directory service is used for identification, authentication, or authorization functions, a compromise of the database objects could lead to a compromise of all systems that rely on the directory service.

The Domain Controllers OU object requires special attention as the Domain Controllers are central to the configuration and management of the domain. Inappropriate access permissions defined for the Domain Controllers OU could allow an intruder or unauthorized personnel to make changes that could lead to the compromise of the domain.


Check Content:
This applies to domain controllers. It is NA for other systems.

Review the permissions on the Domain Controllers OU.

Open "Active Directory Users and Computers" (available from various menus or run "dsa.msc").

Select "Advanced Features" in the "View" menu if not previously selected.

Select the "Domain Controllers" OU (folder in folder icon).

Right-click and select "Properties".

Select the "Security" tab.

If the permissions on the Domain Controllers OU do not restrict changes to System, Domain Admins, Enterprise Admins and Administrators, this is a finding.

The default permissions listed below satisfy this requirement.

Domains supporting Microsoft Exchange will have additional Exchange related permissions on the Domain Controllers OU.  These may include some change related permissions and are not a finding.

The permissions shown are at the summary level. More detailed permissions can be viewed by selecting the "Advanced" button, the desired Permission entry, and the "View" or "Edit" button.

Except where noted otherwise, the special permissions may include a wide range of permissions and properties and are acceptable for this requirement.

CREATOR OWNER - Special permissions

SELF - Special permissions

Authenticated Users - Read, Special permissions

The special permissions for Authenticated Users are Read types.

If detailed permissions include any Create, Delete, Modify, or Write Permissions or Properties, this is a finding.

SYSTEM - Full Control

Domain Admins - Read, Write, Create all child objects, Generate resultant set of policy (logging), Generate resultant set of policy (planning), Special permissions

Enterprise Admins - Full Control

Key Admins - Special permissions

Enterprise Key Admins - Special permissions

Administrators - Read, Write, Create all child objects, Generate resultant set of policy (logging), Generate resultant set of policy (planning), Special permissions

Pre-Windows 2000 Compatible Access - Special permissions

The Special permissions for Pre-Windows 2000 Compatible Access are Read types.

If detailed permissions include any Create, Delete, Modify, or Write Permissions or Properties, this is a finding.

ENTERPRISE DOMAIN CONTROLLERS - Read, Special permissions

#>
return 'Not Reviewed'
