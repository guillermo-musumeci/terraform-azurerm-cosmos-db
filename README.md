# Terraform module for Azure Cosmos DB

Not ready yet

How to use>

```
module "azure_cosmos_db" {
  source               = "./terraform-azurerm-cosmos-db"
  resource_group_name  = azurerm_resource_group.this.name
  location             = azurerm_resource_group.this.location
  cosmos_account_name  = var.cosmos_account_name
  cosmos_api           = var.cosmos_api
  mongo_database_list  = var.mongo_database_list
  mongo_database_collections = var.mongo_database_collections
  depends_on = [
    azurerm_resource_group.this
  ]
}


variable "cosmos_account_name" {}
variable "cosmos_api" {}
variable "mongo_database_list" {}
variable "mongo_database_collections" {}

```

terraform.tfvars

```
 mongo_database_list = {
  one = {
    db_name           = "dbnoautoscale"
    db_throughput     = 400
    db_max_throughput = null
  },
  two = {
    db_name           = "dbautoscale"
    db_throughput     = null
    db_max_throughput = 1000
  }
}

mongo_database_collections = {
  one = {
    collection_name           = "collection1"
    db_name                   = "dbautoscale"
    default_ttl_seconds       = "2592000"
    shard_key                 = "MyShardKey"
    collection_throughout     = 400
    collection_max_throughput = null
    analytical_storage_ttl    = null
    indexes                   = {
      indexone                = {
        mongo_index_keys          = ["_id"]
        mongo_index_unique        = true
      }
    }
  },
  two = {
    collection_name           = "collection2"
    db_name                   = "dbnoautoscale"
    default_ttl_seconds       = "2592000"
    shard_key                 = "MyShardKey"
    collection_throughout     = 400
    collection_max_throughput = null
    analytical_storage_ttl    = null
    indexes                   = {
      indextwo                = {
        mongo_index_keys          = ["_id"]
        mongo_index_unique        = true
      }
    }
  }
}
```
