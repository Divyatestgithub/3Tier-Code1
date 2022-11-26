variable "number_of_machines" {
  type = number
  description = "This defines the number of virtual machines in the virtual network"
  default = 2  
}

variable "resource_group_name" {
  type = string
  description = "name of the resource group"
  default = "app-rg"  
}

variable "location" {
  type = string
  description = "location of resource group"
  default = "North Europe" 
}

variable "name" {
  type = string
  description = "name of the virtual network"
  default = "app-network"  
}

variable "address_space" {
  type = string
  description = "address space of virtual network"
  default = "10.0.0.0/16"
  }