variable "RESOURCE_GROUP_NAME" {
  type        = string
  description = "Resource group name"
  default     = "techcommunityrg"
}

variable "LOCATION" {
  type        = string
  description = "Resource group location"
  default     = "East US"
}

variable "COSMOSDB_ACCOUNT_NAME" {
  type        = string
  description = "Cosmos db account name"
  default     = "techcommunityaccount"
}

variable "COSMOSDB_ACCOUNT_LOCATION" {
  type        = string
  description = "Cosmos db account location"
  default     = "East US"
}

variable "COSMOSDB_SQLDB_NAME" {
  type        = string
  description = "value"
  default     = "TechCommunityDatabase1"
}

variable "SQL_CONTAINER_NAME" {
  type        = string
  description = "SQL API container name."
  default     = "Event"
}

variable "COSMOSDB_MAX_THROUGHPUT" {
  type        = number
  description = "Cosmos db database max throughput"
  default     = 1000
  validation {
    condition     = var.COSMOSDB_MAX_THROUGHPUT >= 1000 && var.COSMOSDB_MAX_THROUGHPUT <= 10000
    error_message = "Cosmos db autoscale max throughput should be equal to or greater than 400 and less than or equal to 1000."
  }
  validation {
    condition     = var.COSMOSDB_MAX_THROUGHPUT % 100 == 0
    error_message = "Cosmos db max throughput should be in increments of 100."
  }
}