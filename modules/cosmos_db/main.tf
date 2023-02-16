resource "azurerm_cosmosdb_sql_database" "cosmossqldb1" {
  name                = var.cosmosdb_sqldb_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  autoscale_settings {
    max_throughput = var.max_throughput
  }
}