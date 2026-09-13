data "azurerm_resource_group" "rg" {
  name = "fbarryRG"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-ecf-stockage"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "snet-aks"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_storage_account" "files" {
  name                     = "stecffilesfbarry2026"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "employees_share" {
  name                 = "employes"
  storage_account_name = azurerm_storage_account.files.name
  quota                = 50
}