resource "azurerm_mssql_server" "sql" {
  name                         = "sqlserverfbarry2026"
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "db" {
  name      = "ecf-database"
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "Basic"
}