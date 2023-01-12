resource "azurerm_mssql_server" "dev" {
    name = var.dev_database
    resource_group_name = var.resource_group
    location = var.location
    version = var.dev_database_version
    administrator_login = var.dev_db_admin
    administrator_login_password = var.dev_db_password
}

resource "azurerm_mssql_database" "db" {
  name                = "db"
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = azurerm_mssql_server.dev.name
}

resource "azurerm_mssql_virtual_network_rule" "sqlvnetrule" {
  name                = "sql-vnet-rule"
  resource_group_name = var.resource_group
  server_name         = azurerm_mssql_server.dev.name
  subnet_id           = var.data-subnet-id
}