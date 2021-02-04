# Storage: storageAccounts
**Microsoft Docs**: _[Azure Storage encryption for data at rest](https://docs.microsoft.com/en-us/azure/storage/common/storage-service-encryption)_<br>
**Description:** Azure Storage automatically encrypts data when persisted to the cloud. Azure Storage encryption protects data to help meet organizational security and compliance commitments. This policy allows for monitoring for encrypted (true) or unencrypted (false) storage accounts.<br>
At this time, it's important to note that Azure encrypts all file storage accounts by default but this policy allows for monitoring for unencrypted storage accounts for legacy and future purposes.<br>
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
#### File Encryption Enabled
Monitor for Encrypted (true) or unencrypted (false) File Storage