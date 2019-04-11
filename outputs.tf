output "sql_myserver_name" {
  description = "Server name of the Azure MySQL Server created."
  value       = ["${azurerm_mysql_server.server.*.name}"]
}

output "mysql_server_location" {
  description = "Location of the Azure MySQL Server created."
  value       = ["${azurerm_mysql_server.server.*.location}"]
}

output "mysql_server_version" {
  description = "Version the Azure SQL Server created."
  value       = ["${azurerm_mysql_server.server.*.version}"]
}

output "mysql_server_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure MySQL server created."
  value       = ["${azurerm_mysql_server.server.*.fqdn}"]
}
