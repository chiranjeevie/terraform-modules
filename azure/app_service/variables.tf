variable "app_service_name" {
  description = "Name of the App Service"
}

variable "location" {
  description = "Azure region where the App Service will be created"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "service_plan_id" {
  description = "ID of the Azure App Service Plan"
}