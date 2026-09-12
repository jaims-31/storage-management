resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-ecf-stockage"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  dns_prefix          = "aksecfstockage"
  sku_tier            = "Free"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = azurerm_subnet.aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
  }
}