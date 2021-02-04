# SQL: servers/administrators
**Microsoft Docs**: _[Use Azure Active Directory authentication](https://docs.microsoft.com/en-us/azure/azure-sql/database/authentication-aad-overview)_<br>
**Description:** Azure Active Directory (Azure AD) authentication is a mechanism for connecting to Azure SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics (formerly SQL Data Warehouse) by using identities in Azure AD.<br>
## Administrator Type
This configuration item determines the type of Administrator where Azure AD is currently the only option.
### Parameters
This section describes the Parameters used in this policy
#### Effect
Define the effect of the Policy as Audit or Deny<br>
**Default Value:** AuditIfNotExists<br>
**Allowed Values:**
* AuditIfNotExists
* DeployIfNotExists
* Disabled
#### AAD Login
Azure Active Directory UPN of the User or Group who will act as Administrators for SQL Servers
#### AAD SID
Azure Active Directory Security Identifier (Object ID) of the User or Group who will act as Administrators for SQL Servers
#### AAD Tenant ID
Identifier for the Azure Active Directory Tenant of the User or Group who will act as Administrators for SQL Servers