output "sql_database_id" {
    description = "Id of SQL Database instace"
    value = azurerm_mssql_database.db.id
}