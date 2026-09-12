resource "azurerm_storage_account" "velero" {
  name                     = "stecfvelerofbarry2026"
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "velero" {
  name                   = "velero-backups"
  storage_account_name   = azurerm_storage_account.velero.name
  container_access_type  = "private"
}