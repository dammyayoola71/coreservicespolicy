# Storage: storageAccounts
**Microsoft Docs**: _[Enable soft delete on Azure file shares](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-enable-soft-delete?tabs=azure-portal)_<br>
**Description:** Azure Storage offers soft delete for file shares (preview) to enably recovery of data when it's mistakenly deleted by an application or other storage account user. This policy monitors for enabling (true) or disabling (false) soft delete.<br>
If enabling, the user must also provide a retenion period, measured in days.<br>
If the policy should allow disabling of soft delete, the policy must also include 'null' as the default parameter does not populate on new resources and returns 'null' as opposed to false.<br>
## File Storage Encryption
This policy evaluates File type Storage accounts.
### Parameters
This section describes the Parameters used in this policy
#### Effect
Define the effect of the Policy as Audit or Deny<br>
**Default Value:** AuditIfNotExists<br>
**Allowed Values:**
* Audit
* Deny
#### File Storage Soft Delete
Define the effect of the Policy as Audit or Deny<br>
**Default Value:** 
* true
* false
* null
**Allowed Values:**
* true
* false
* null