resource "azurerm_app_service_plan" "example" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  is_xenon          = var.reserved

  tags = var.tags
}

output "service_plan_id" {
  value = azurerm_app_service_plan.example.id
}
