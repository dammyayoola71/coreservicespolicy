### Microsoft.Network/virtualNetworks/subnets[*].networkSecurityGroup
**Microsoft Docs**: [Network security groups]https://docs.microsoft.com/en-us/azure/virtual-network/security-overview)<br>
**Description:** Azure network security groups  filter network traffic to and from Azure resources in an Azure virtual network. This policy allows for targeting network security groups with specific names. Every virtual network gets a **default** subnet assigned on creation. In addition, Azure reserves two subnet names for specific purpose, **GatewaySubnet** and **AzureFirewallSubnet**. This policy parameter defaults to these values but an administrator can update this parameter to any value they desire. Separate multiple compliant nameswith a semi-colon, ';'.<br>
**Default Value:** default, GatewaySubnet, AzureFirewallSubnet<br>
**Allowed Values:**
* Any value desired. Separate multiple compliant values with a semicolon: ';'