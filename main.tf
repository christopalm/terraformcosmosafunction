terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.42.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "TerraformStates"
    storage_account_name = "terraformtechcommunity"
    container_name       = "terraformstate"
    key                  = "terraformstatefile.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = var.RESOURCE_GROUP_NAME
  location = "East US"
}

module "cosmosdbaccount1" {
  source = "./modules/cosmos_account"

  cosmosdb_account_name     = var.COSMOSDB_ACCOUNT_NAME
  cosmosdb_account_location = var.COSMOSDB_ACCOUNT_LOCATION
  location                  = var.LOCATION
  resource_group_name       = var.RESOURCE_GROUP_NAME
}

module "cosmossqldb1" {
  source = "./modules/cosmos_db"

  cosmosdb_account_name = var.COSMOSDB_ACCOUNT_NAME
  cosmosdb_sqldb_name   = var.COSMOSDB_SQLDB_NAME
  resource_group_name   = var.RESOURCE_GROUP_NAME
  max_throughput        = var.COSMOSDB_MAX_THROUGHPUT
}

module "sqlcontainer1" {
  source = "./modules/cosmos_container"

  sql_container_name    = var.SQL_CONTAINER_NAME
  resource_group_name   = var.RESOURCE_GROUP_NAME
  cosmosdb_account_name = var.COSMOSDB_ACCOUNT_NAME
  cosmosdb_sqldb_name   = var.COSMOSDB_SQLDB_NAME
  max_throughput        = var.COSMOSDB_MAX_THROUGHPUT
}

module "functionapp1" {
  source = "./modules/windows_function_app"

  function_app_name = "fa-data-api-dev"
  cosmosdb_connectionstring = module.cosmosdbaccount1.cosmos_db_connection_string
  location = var.LOCATION
  resource_group_name = var.RESOURCE_GROUP_NAME
}