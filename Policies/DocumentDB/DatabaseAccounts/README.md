# DocumentDB: databaseAccounts
**Microsoft Docs**: [Azure Cosmos DB documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/)

## Policy Aliases
Below are the list of Policy Aliases included in this Policy

### Microsoft.DocumentDB/databaseAccounts/enableAutomaticFailover
**Microsoft Docs**: [High availability with Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/high-availability)
Description: Azure Cosmos Databases can have failover enabled, _true_, or disabled, _false_. This policy allows for selection of either or both to ignore the policy.<br>
Default Value: true, false <br>
Allowed Values:
* true
* false

### Microsoft.DocumentDB/databaseAccounts/consistencyPolicy.defaultConsistencyLevel
**Microsoft Docs**: [Consistency levels in Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels)
Description: Distributed databases that rely on replication for high availability, low latency, or both, make the fundamental tradeoff between the read consistency vs. availability, latency, and throughput. Azure Cosmos DB approaches data consistency as a spectrum of choices instead of two extremes. These choices include **strong**, **bounded staleness**, **session**, **consistent prefix**, and **eventual** consistency. <br>
Default Value: Strong, BoundedStaleness, Session, ConsistentPrefix, Eventual <br>
Allowed Values:
* Strong
* BoundedStaleness
* Session
* ConsistentPrefix
* Eventual