resource "azurerm_virtual_network" "appnetwork" {
  name                = var.name
  location            = var.location  
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
  depends_on = [
    azurerm_resource_group.appgrp
  ]  
} 


resource "azurerm_subnet" "subnetA" {    
    name                 = "SubnetA"
    resource_group_name  = var.resource_group_name
    virtual_network_name = var.name
    address_prefixes     = ["10.0.0.0/24"]
    depends_on = [
      azurerm_virtual_network.appnetwork
    ]
}

resource "azurerm_network_security_group" "appnsg" {
  name                = "app-nsg"
  location            = var.location 
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "ssh"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

depends_on = [
    azurerm_virtual_network.appnetwork
  ]
}

resource "azurerm_subnet_network_security_group_association" "appnsg-link" {  
  subnet_id                 = azurerm_subnet.subnetA.id
  network_security_group_id = azurerm_network_security_group.appnsg.id

  depends_on = [
    azurerm_virtual_network.appnetwork,
    azurerm_network_security_group.appnsg,
    azurerm_subnet.subnetA
  ]
}

