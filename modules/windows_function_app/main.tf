resource "azurerm_storage_account" "blobstorage1" {
  name                     = "safa1dev"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp1" {
  name                = "asp-fa-tech-com-dev"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "functionapp1" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.asp1.id
  storage_account_name       = azurerm_storage_account.blobstorage1.name
  storage_account_access_key = azurerm_storage_account.blobstorage1.primary_access_key

  site_config {
  }

  app_settings = {
    "Google_URL"               = "www.google.com"
    "Cosmos_Connection_String" = var.cosmosdb_connectionstring
  }

}