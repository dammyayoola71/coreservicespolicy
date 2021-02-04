# Network: applicationGateways
**Microsoft Docs**: [Azure Application Gateway](https://docs.microsoft.com/azure/application-gateway/)
## Policy Aliases
Below are the list of Policy Aliases included in this Policy
### Microsoft.Network/applicationGateways/sku.tier
**Description:** Application Gateways offer two types, _Standard & Web Application Firewall_, and two versions, _v1 & v2_, of SKU. This policy allows for Audit and Enforcement of any of the 4 available types.<br>
**Microsoft Docs**: [Application Gateway v1 & v2](https://docs.microsoft.com/azure/application-gateway/application-gateway-autoscaling-zone-redundant)<br>
**Display Name:** sku.tier<br>
**Default Value(s):** Standard, Standard_v2, WAF, WAF_v2<br>
**Allowed Values:**
* Standard
* Standard_v2
* WAF
* WAF_v2

### Microsoft.Network/applicationGateways/webApplicationFirewallConfiguration.firewallMode
**Description:** Azure Application Gateway firewalls have two modes, _Detection and Prevention_. This policy allows for Audit or Deny for both modes. If the Application Gateway has not initialized the firewall, a third mode, _null_, becomes the value. The policy accounts for this mode as well.<br>
**Microsoft Docs:** [_Azure Web Application Firewall on Azure Application Gateway_](https://docs.microsoft.com/en-us/azure/web-application-firewall/ag/ag-overview)<br>
**Display Name:** Web Application Firewall Mode<br>
**Default Value(s):** Prevention, Detection<br>
**Allowed Values:**
* Prevention
* Detection

### Microsoft.Network/applicationGateways/webApplicationFirewallConfiguration.enabled
**Description:** Only Web Application Firewall mode allows for enabling or disabling the firewall. Standard mode has no such setting. An enabled WAF sets the value to _True_, a disabled WAF to _False_. Firewalls the Application Gateway has not yet initialized get a value of _null_. This Policy allows for auditing and denying of any of the three values.<br>
**Microsoft Docs:** [WAF Policy](https://docs.microsoft.com/azure/web-application-firewall/ag/ag-overview#waf-policy)<br>
**Display Name:** Web Application Firewall Enabled<br>
**Default Value(s):** True, False, null<br>
**Allowed Values:**
* True
* False
* null