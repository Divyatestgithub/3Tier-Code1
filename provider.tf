terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  tenant_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  client_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  features {}  
}
