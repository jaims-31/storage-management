resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "mysqlserverfbarry2026"
  resource_group_name    = data.azurerm_resource_group.rg.name
  location               = data.azurerm_resource_group.rg.location
  administrator_login    = "mysqladminuser"
  administrator_password = var.sql_admin_password
  sku_name               = "B_Standard_B2s"
  version                = "8.0.21"
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = "ecf-database"
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}