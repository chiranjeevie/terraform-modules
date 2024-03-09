variable "subnet_name" {
  description = "Name of the Subnet"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the Subnet"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network"
}