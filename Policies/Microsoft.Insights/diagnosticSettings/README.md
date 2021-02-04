# Insights: Diagnostic Settings
**Microsoft Docs**: [Create diagnostic setting to collect resource logs and metrics in Azure](https://docs.microsoft.com/azure/azure-monitor/platform/diagnostic-settings)
## Policy Aliases
Below are the list of Policy Aliases included in this Policy
### field:type
**Description:** Select the Resource Types to apply the Diagnostic Settings policy. This list only includes a subset of the possible Resources <br>
**Microsoft Docs:** [Metrics Exportable Table](https://docs.microsoft.com/azure/azure-monitor/platform/metrics-supported-export-diagnostic-settings#metrics-exportable-table)<br>
**Display Name:** Resource Types<br>
**Default Value(s):** Microsoft.DataFactory/factories, Microsoft.DataLakeStore/accounts, Microsoft.Network/applicationGateways, Microsoft.KeyVault/vaults<br>
**Allowed Values:**
* Microsoft.DataFactory/factories
* Microsoft.DataLakeStore/accounts
* Microsoft.Network/applicationGateways
* Microsoft.KeyVault/vaults
* Microsoft.RecoveryServices/vaults
* Microsoft.Databricks/workspaces

### _Microsoft.Insights/diagnosticSettings/workspaceId
**Description:** Azure Monitor can send Diagnostic Settings to a Log Analytics Workspace. Azure Monitor requires the configuration of the Workspace on the Diagnostic Settings object. This Policy audits or enforces the existence of the Workspace ID. _True_ indicates that the a workspace was registered. _False_ indicates that a workspace was not registered.<br>
**Microsoft Docs:** [Collect Azure platform logs in Log Analytics workspace in Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/platform/resource-logs-collect-workspace)<br>
**Display Name:** Stream to Log Analytics<br>
**Default Value(s):** True, False<br>
**Allowed Values:**
* True
* False

### Microsoft.Insights/diagnosticSettings/storageAccountId
**Description:** Azure Monitor can send Diagnostic Settings to a Storage Account. Azure Monitor requires the configuration of the Storage Account on the Diagnostic Settings object. This Policy audits or enforces the existence of the Storage Account ID. _True_ indicates that the a workspace was registered. _False_ indicates that a workspace was not registered.<br>
**Microsoft Docs:** [Archive Azure resource logs to storage account](https://docs.microsoft.com/azure/azure-monitor/platform/resource-logs-collect-storage)<br>
**Display Name:** Stream to Storage Account<br>
**Default Value(s):** True, False<br>
**Allowed Values:**
* True
* False

### Microsoft.Insights/diagnosticSettings/eventHubAuthorizationRuleId
**Description:** _Policy Alias Description_<br>
**Microsoft Docs:** [Stream Azure platform logs to Azure Event Hub](https://docs.microsoft.com/azure/azure-monitor/platform/resource-logs-stream-event-hubs)<br>
**Display Name:** Stream to Event Hub<br>
**Default Value(s):** True, False<br>
**Allowed Values:**
* True
* False