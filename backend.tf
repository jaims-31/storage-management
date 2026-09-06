terraform {
  backend "azurerm" {
    resource_group_name  = "fbarryRG"
    storage_account_name = "stecffbarry2026"
    container_name       = "tfstate"
    key                  = "ecf-stockage.tfstate"
  }
}