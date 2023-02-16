variable "resource_group_name"{
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource group location"
}

variable "cosmosdb_connectionstring" {
  type        = string
  description = "Cosmos Account Connection string"
}

variable "function_app_name" {
  type        = string
  description = "Function App Name"
}