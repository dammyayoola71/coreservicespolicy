### Microsoft.Cache/Redis/enableNonSslPort
**Microsoft Docs**: [How to configure Azure Cache for Redis: Access Ports](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-configure#access-ports)<br>
**FAQ**: [When should I enable the non-TLS/SSL port for connecting to Redis?](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-faq#when-should-i-enable-the-non-tlsssl-port-for-connecting-to-redis)<br>
**Description:** By default, non-TLS/SSL access is disabled, _false_, for new caches. Allowing access via non-SSL, _true_, allows for access through a non-SSL port.<br>
**Default Value:** true, false<br>
**Allowed Values:**
* true
* false