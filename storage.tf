resource "azurerm_storage_account" "files" {
  name                     = "stecffilesfbarry2026"
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_share" "employes" {
  name                 = "partage-employes"
  storage_account_name = azurerm_storage_account.files.name
  quota                = 50
}

data "azuread_group" "employes" {
  object_id = "9c9a92d7-fb31-4cbc-9202-99d617567575"
}

resource "azurerm_role_assignment" "employes_smb" {
  scope                = azurerm_storage_account.files.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = data.azuread_group.employes.object_id
}