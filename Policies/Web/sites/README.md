# Web: Sites
**Microsoft Docs**: [App Service documentation](https://docs.microsoft.com/en-us/azure/app-service/)

## Policy Aliases
Below are the list of Policy Aliases included in this Policy

---------

### Microsoft.Web/sites/clientCertEnabled
**Microsoft Docs**: [Configure TLS mutual authentication for Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-configure-tls-mutual-auth)<br>
**Description:** One way to restrict access to applications includes requesting a client certificate. Known as Mutual Authentication, where the User authenticates the Application and the Application authenticates the User, Azure App Services can be configured to Require Client Certificates, _True_, or not, _False_.<br>
**Default Value:** true, false<br>
**Allowed Values:**
* true
* false

---------

### Microsoft.Web/sites/httpsOnly
**Microsoft Docs**: [Enforce HTTPS](https://docs.microsoft.com/en-us/azure/app-service/configure-ssl-bindings#enforce-https)<br>
Description: By default, anyone can access apps using HTTP. Admins can redirect all HTTP requests to the HTTPS port by setting the HTTPS only flag.<br>

---------

#### HTTPS Only
Determines whether Web Sites allow HTTPS Only (true) or not (false)<br>
Allowed Values:
* true
* false

---------

#### Kind
Determines which Web Sites the policy applies to<br>
Allowed Values:
* API
* App
* Function App