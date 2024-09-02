#########################
## MongoDB - Variables ##
#########################

variable "mongo_database_list" {
  type = map(object({
    db_name           = string
    db_throughput     = number
    db_max_throughput = number
  }))
  description = "Map of CosmosDB Mongo Databases to create"
  default     = {}
}

variable "mongo_database_collections" {
  type = map(object({
    collection_name           = string
    db_name                   = string
    default_ttl_seconds       = string
    shard_key                 = string
    collection_throughout     = number
    collection_max_throughput = number
    analytical_storage_ttl    = number
    indexes = map(object({
      mongo_index_keys   = list(string)
      mongo_index_unique = bool
    }))
  }))
  description = "List of CosmosDB Mongo Collections to create"
  default     = {}
}

####################################
## Firewall & Network - Variables ##
####################################

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access to CosmosDB"
  default     = false
}

variable "firewall_ip_list" {
  type        = list(string)
  description = "List of IP Addresses to allow access from the internet or on-premises network"
  default     = []
}

##############################
## Basic Module - Variables ##
##############################

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group to create resources"
}

variable "location" {
  type        = string
  description = "CosmosDB deployment region"
}

variable "tags" {
  type        = map(string)
  description = "The collection of tags to be applied to all resources"
  default     = {}
}

variable "cosmos_account_name" {
  type        = string
  description = "Name of the CosmosDB account"
  default     = ""
}