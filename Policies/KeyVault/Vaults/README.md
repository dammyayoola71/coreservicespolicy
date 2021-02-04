# KeyVault: vaults
**Microsoft Docs**: [Azure Key Vault documentation](https://docs.microsoft.com/en-us/azure/key-vault/general/)

## Policy Aliases
Below are the list of Policy Aliases included in this Policy

### Microsoft.KeyVault/vaults/enabledForDeployment
**Microsoft Docs**: [Use Azure Key Vault to pass secure parameter value during deployment](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/key-vault-parameter?tabs=azure-cli)<br>
Description: When creating resources such as Virtual Machines or SQL Server, Azure can store the administrative credentials in Key Vault. Each Key Vault must have the Enabled for Deployment configuration enabled, _true_. If disabled, _false_, other Azure Resources can not store secrets in the Key Vault. By default, Key Vaults do not allow other Resource secrets and default to an uninitialized state, _null_.<br>
Default Value: true, false, null <br>
Allowed Values:
* true
* false
* null

### Microsoft.KeyVault/vaults/enabledForDiskEncryption
**Microsoft Docs**: [Creating and configuring a key vault for Azure Disk Encryption](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/disk-encryption-key-vault)<br>
Description: Azure Disk Encryption uses Azure Key Vault to control and manage disk encryption keys and secrets. Each Key Vault can be configured to allow for Disk Encryption Keys/Secrets, _true_, or not, _false_. New Vaults remain uninitiateid and default to not allowing Disk Encryption Secrets, _null_.<br>
Default Value: true, false, null <br>
Allowed Values:
* true
* false
* null

### Microsoft.KeyVault/vaults/enabledForTemplateDeployment
**Microsoft Docs**: [Use Azure Key Vault to pass secure parameter value during deployment](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/key-vault-parameter?tabs=azure-cli)<br>
Description: Instead of storing secrets in Deployment Templates, Azure allows for storing those secrets in Key Vault. Key Vaults can be configured to allow them accept Deployment Secrets, _true_, or not, _false_. Key Vaults default to not allowing Deployment Secrets, _null_.<br>
Default Value: true, false, null <br>
Allowed Values:
* true
* false
* null

### Microsoft.KeyVault/vaults/enablePurgeProtection
**Microsoft Docs**: [Purge protection](https://docs.microsoft.com/en-us/azure/key-vault/general/overview-soft-delete#purge-protection)<br>
Description: Azure Key Vaults allow for protection from permanently deleting the Key Vault. Key Vaults can have this setting, Purge Protection, enabled, _true_ or disabled, _false_. This policy allows for evaluation of one or both of these settings. If the setting was never initiated, the value of _null_ gets assigned.<br>
Default Value: true, false, null <br>
Allowed Values:
* true
* false
* null

### Microsoft.KeyVault/vaults/enableSoftDelete
**Microsoft Docs**: [Soft-delete behavior](https://docs.microsoft.com/en-us/azure/key-vault/general/overview-soft-delete#soft-delete-behavior)<br>
Description: Azure Key Vaults allow for retaining deleted keys for a set period of time (90 Days). Key Vaults default to disbaled, _null_. Once enabled, _true_, this setting may not be disabled. This policy allows for evaluation of one or both of these settings.<br>
Default Value: true, null <br>
Allowed Values:
* true
* null