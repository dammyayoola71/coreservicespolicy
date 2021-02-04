# DataFactory: factories
**Microsoft Docs**: [Store credential in Azure Key Vault](https://docs.microsoft.com/en-us/azure/data-factory/store-credentials-in-key-vault)

## Policy Aliases
Below are the list of Policy Aliases included in this Policy

### Microsoft.DataFactory/factories/linkedservices/type
Description: Data Factories can have multiple types of linked services. This policy only checks those who are not connected directly to a Key Vault<br>
Default Value: n/a <br>
Allowed Values:
* not: AzureKeyVault

### Microsoft.DataFactory/factories/linkedservices/typeProperties.connectionString.type
Description: Data Factories can store credentials as Plain Text or in a Key Vault. This policy only checks for those policies that are not in a Key Vault<br>
Default Value: n/a <br>
Allowed Values:
* not: AzureKeyVaultSecret