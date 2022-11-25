variable "azurerm_resource_group" {
    description = "resource group for resources"
    type = string
    default = "rsg-kpmg"
}

variable "location" {
    description = "resource location"
    type = string
    default = "West Europe"
}

#database variables
variable "mysql_server_instance" {
  description = "mysql instance related varaibles"
  type = map(any)
  default = {
    name                                =   "kpmg-mysqlserver"
    sku_name                            =   "B_Gen5_2"
    administrator_login                 =   "mysqladmin"
    administrator_login_password        =   "Divya@123"
    storage_mb                          =   5120
    version                             =   "5.7"
    auto_grow_enabled                   =   true
    backup_retention_days               =   7
    geo_redundant_backup_enabled        =   false
    infrastructure_encryption_enabled   =   false
    public_network_access_enabled       =   true
    ssl_enforcement_enabled             =   true
    ssl_minimal_tls_version_enforced    =   "TLS1_2"
  }
}

