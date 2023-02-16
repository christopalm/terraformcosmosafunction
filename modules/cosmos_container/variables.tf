variable "sql_container_name" {
  type        = string
  description = "SQL API container name."
}

variable "resource_group_name"{
  type        = string
  description = "Resource group name"
}

variable "cosmosdb_account_name" {
  type        = string
  description = "Cosmos db account name"
}

variable "cosmosdb_sqldb_name" {
  type        = string
  description = "Cosmos database name"
}

variable "max_throughput" {
  type        = number
  description = "Cosmos db database max throughput"
}