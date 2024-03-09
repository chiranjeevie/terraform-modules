variable "vnet_name" {
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "location" {
  description = "Azure region where the Virtual Network will be created"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}
