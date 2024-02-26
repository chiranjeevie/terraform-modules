variable "app_service_name" {
  type        = string
  description = "Name of the App Service"
}

variable "location" {
  type        = string
  description = "Location for the App Service"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "runtime_stack" {
  type        = string
  description = "Runtime stack for the App Service"
  default     = "node"
}

variable "app_settings" {
  type        = map(string)
  description = "App settings for the App Service"
  default     = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "14.17.5"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = ""
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags for the App Service"
  default     = {}
}
