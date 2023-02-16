output "cosmos_db_connection_string" {
  description = "Connection string for Cosmos"
  value       = azurerm_cosmosdb_account.cosmosdbaccount1.connection_strings[0]
}