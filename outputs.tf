output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "storage_account_files_name" {
  value = azurerm_storage_account.files.name
}

output "storage_account_velero_name" {
  value = azurerm_storage_account.velero.name
}