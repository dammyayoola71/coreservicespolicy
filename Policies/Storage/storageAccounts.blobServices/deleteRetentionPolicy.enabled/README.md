# Storage: storageaccounts.blobStorage
**Microsoft Docs**: [Azure Blob storage documentation](https://docs.microsoft.com/en-us/azure/storage/blobs/)

## Policy Aliases
Below are the list of Policy Aliases included in this Policy

### Microsoft.Storage/storageAccounts/blobServices/deleteRetentionPolicy.enabled
**Microsoft Docs**: [Enable and manage soft delete for blobs](https://docs.microsoft.com/en-us/azure/storage/blobs/soft-delete-blob-enable?tabs=azure-portal)
Description: Blob soft delete protects data from accidental or erroneous modification or deletion. This policy monitors and enforces Blob Storage soft delete settings. When enabling soft delete, Azure also requires the number of retention days.<br>


#### Parameters
**deleteRetentionPolicy.enabled**

Type: Boolean <br>
Default Value: true, false <br>
Allowed Values:
* true
* false

**retentionDays**

Type: Integer <br>
Default Value: none <br>