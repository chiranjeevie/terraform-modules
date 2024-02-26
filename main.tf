provider "azurerm" {
  features = {}
}

provider "azurerm" {
  features = {}
}

locals {
  project_config = jsondecode(file("input_variables.json"))
}

module "resource_group" {
  source              = "./azure/resource_group"
  location            = local.project_config["location"]
}

module "service_plan" {
  source             = "./azure/service_plan"
  resource_group     = module.resource_group.resource_group_name
  service_plan_name  = local.project_config["service_plan_name"]
  location           = local.project_config["location"]
  sku_tier           = local.project_config["sku_tier"]
  sku_size           = local.project_config["sku_size"]
}

module "app_service" {
  source            = "./azure/app_service"
  resource_group_id = module.resource_group.resource_group_id
  resource_group_name = local.project_config["resource_group_name"]

  service_plan_id   = module.service_plan.service_plan_id
  app_service_name  = local.project_config["app_service_name"]
  location          = local.project_config["location"]
}

module "storage_account" {
  source       = "./azure/storage_account"
}

module "sql_database" {
  source       = "./azure/sql_database"
}

module "cosmosdb" {
  source       = "./azure/cosmosdb"
}

module "mysql_database" {
  source       = "./azure/mysql_database"
}

module "postgresql_database" {
  source       = "./azure/postgresql_database"
}
