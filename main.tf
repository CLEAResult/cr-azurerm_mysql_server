# can be used for additional accounts
resource "random_string" "password" {
  length           = 16
  special          = true
  override_special = "/@\" "
}
resource "azurerm_mysql_server" "server" {
  name                         = "${local.name}${format("%03d", count.index + 1)}"
  count                        = "${var.count}"
  resource_group_name          = "${var.rg_name}"
  location                     = "${var.location}"
  version                      = "${var.server_version}"
  administrator_login          = "${var.sql_admin_username}"
    administrator_login_password = ""
  #administrator_login_password = "${local.sql_admin_password}"
  ssl_enforcement              = "Enabled"

  sku {
    name     = "${substr(var.server_edition,0,1)}_Gen5_${var.vcores}"
    capacity = "${var.vcores}"
    tier     = "${var.server_edition}"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = "${var.database_storage_mb}"
    backup_retention_days = "${var.backup_retention_days}"
    geo_redundant_backup  = "${var.geo_redundant_backup}"
  }

  tags = {
    InfrastructureAsCode = "True"
  }

  lifecycle {
    ignore_changes = ["administrator_login_password", "tags"]
  }
}
