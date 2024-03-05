variable "service_plan_name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "location" {
  type        = string
  description = "Location for the App Service Plan"
}

variable "os_type" {
  type        = string
  description = "os_type for the App Service Plan"
}

variable "sku_name" {
  type        = string
  description = "sku_name for the App Service Plan"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}

variable "sku_tier" {
  type        = string
  description = "Tier of the App Service Plan"
}

variable "sku_size" {
  type        = string
  description = "Size of the App Service Plan"
}

variable "capacity" {
  type        = int
  description = "Number of instances to run"
  default     = 1
}

variable "reserved" {
  type        = bool
  description = "Whether to use reserved instances"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags for the App Service Plan"
  default     = {}
}
