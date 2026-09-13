resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-ecf-stockage"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "aksecfstockage"

  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

network_profile {
    network_plugin = "kubenet"
    service_cidr   = "10.240.0.0/16"
    dns_service_ip = "10.240.0.10"
  }
}

