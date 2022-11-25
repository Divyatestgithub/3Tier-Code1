resource "azurerm_resource_group" "kpmg-rsg" {
  name     = var.azurerm_resource_group
  location = var.location
}

resource "azurerm_mysql_server" "kpmg-mysql" {
  name                = var.mysql_server_instance.name
  location            = azurerm_resource_group.kpmg-rsg.location
  resource_group_name = azurerm_resource_group.kpmg-rsg.name

  administrator_login          = var.mysql_server_instance.administrator_login
  administrator_login_password = var.mysql_server_instance.administrator_login_password

  sku_name   = var.mysql_server_instance.sku_name
  storage_mb = var.mysql_server_instance.storage_mb
  version    = var.mysql_server_instance.version

  auto_grow_enabled                 = var.mysql_server_instance.auto_grow_enabled
  backup_retention_days             = var.mysql_server_instance.backup_retention_days
  geo_redundant_backup_enabled      = var.mysql_server_instance.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.mysql_server_instance.infrastructure_encryption_enabled
  public_network_access_enabled     = var.mysql_server_instance.public_network_access_enabled
  ssl_enforcement_enabled           = var.mysql_server_instance.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.mysql_server_instance.ssl_minimal_tls_version_enforced
}
