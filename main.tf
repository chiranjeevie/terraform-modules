# Output the container name
output "container_name" {
  value = ""
}

# Output the storage account name
output "storage_account_name" {
  value = local.input_values["storage_account_name"]
}

locals {
  input_values = jsondecode(file("input_values.json"))
}

# Azure provider
provider "azurerm" {
  features {}
}

# Configure Terraform backend for Azure Storage
#terraform {
#  backend "azurerm" {
 #   resource_group_name   = "american-tf-1-lines-resources"
 #   storage_account_name   = "chirustorageaccount"
 #   container_name         = "chiru-test-storage-container"
 #   key                    = "new_terraform.tfstate"
 # }
#}

module "vnet" {
  source                = "./azure/vnet"
  vnet_name             = local.input_values["vnet_name"]
  vnet_address_space    = local.input_values["vnet_address_space"]
  location              = local.input_values["location"]
  resource_group_name   = local.input_values["resource_group_name"]
}

module "subnet" {
  source               = "./azure/subnet"
  subnet_name          = local.input_values["subnet_name"]
  subnet_address_prefix = local.input_values["subnet_address_prefix"]
  resource_group_name  = local.input_values["resource_group_name"]
  virtual_network_name = local.input_values["vnet_name"]
  depends_on = [module.vnet]

}

data "azurerm_resource_group" "existing_rg" {
  count = local.input_values["resource_group_name"] != "" ? 1 : 0
  name  = local.input_values["resource_group_name"]
}

resource "azurerm_resource_group" "new_rg" {
  count     = local.input_values["resource_group_name"] == "" ? 1 : 0
  name      = local.input_values["resource_group_name"] != "" ? local.input_values["resource_group_name"] : ""
  location  = local.input_values["location"]
}

module "service_plan" {
  source             = "./azure/service_plan"
  resource_group     = local.input_values["resource_group_name"]
  service_plan_name  = local.input_values["service_plan"]
  location           = local.input_values["location"]
  os_type            = local.input_values["os_type"]
  sku_name           = local.input_values["sku_name"]
  sku_tier           = local.input_values["sku_tier"]
  sku_size           = local.input_values["sku_size"]
}


module "app_service" {
  source                = "./azure/app_service"
  app_service_name      = local.input_values["app_service_name"]
  location              = local.input_values["location"]
  resource_group_name   = local.input_values["resource_group_name"]
  service_plan_id       = module.service_plan.service_plan_id

  # Connect the App Service to the Subnet
  depends_on = [module.subnet]
}

# Output the resource group name
output "resource_group_name" {
  value = local.input_values["resource_group_name"]
}

output "runtime" {
  value = local.input_values["runtime"]
}