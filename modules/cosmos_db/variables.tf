variable "cosmosdb_account_name" {
  type        = string
  description = "Cosmos db account name"
}

variable "cosmosdb_sqldb_name" {
  type        = string
  description = "Cosmos database name"
}

variable "resource_group_name"{
  type        = string
  description = "Resource group name"
}

variable "max_throughput" {
  type        = number
  description = "Cosmos db database max throughput"
}