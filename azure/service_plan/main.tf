resource "azurerm_service_plan" "example" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group

  os_type   = var.os_type
  sku_name  = var.sku_name
}

