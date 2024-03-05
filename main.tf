# Azure provider
provider "azurerm" {
  features {}
}

locals {
  project_config = jsondecode(file("input_variables.json"))
}

data "azurerm_resource_group" "existing_rg" {
  count = var.resource_group_name != "" ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "new_rg" {
  count     = var.resource_group_name == "" ? 1 : 0
  name      = var.resource_group_name != "" ? var.resource_group_name : "default-rg"
  location  = var.location
}

module "service_plan" {
  source             = "./azure/service_plan"
  resource_group     = module.resource_group.resource_group_name
  service_plan_name  = var.app_service_plan_name
  location           = var.location
  os_type            = var.os_type
  sku_name           = var.sku_name
  sku_tier           = var.sku_tier
  sku_size           = var.sku_size
}

# Configure Terraform backend for Azure Storage
terraform {
  backend "azurerm" {
    resource_group_name   = "american-tf-1-lines-resources"
    storage_account_name   = "chirustorageaccount"
    container_name         = "chiru-test-storage-container"
    key                    = "new_terraform.tfstate"
  }
}