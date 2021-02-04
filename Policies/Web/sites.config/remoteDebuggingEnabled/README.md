# Web: sites/config
**Microsoft Docs**: _[Debugging an Azure cloud service or virtual machine in Visual Studio](https://docs.microsoft.com/en-us/visualstudio/azure/vs-azure-tools-debug-cloud-services-virtual-machines?view=vs-2019)_<br>
**Description:** Visual studio allows different options for debugging Azure cloud services and virtual machines. This policy considers the Remote Logging configuraiton of API, App and Function App services. This policy can Identify (AuditIfNotExists) non-compliant resources or Remediate non-compliant resources (DeployIfNotExists).<br>
## Parameters
This section describes the Parameters used in this policy
### Effect
Define the effect of the Policy as Audit or Deny<br>
**Default Value:** AuditIfNotExists<br>
**Allowed Values:**
* AuditIfNotExists
* DeployIfNotExists
* Disabled