resource "azurerm_service_plan" "example" {
  name                = "american-airlines-app-serviceplan"
  location            = var.location
  resource_group_name = var.resource_group

  os_type   = var.os_type
  sku_name  = var.sku_name
}

output "service_plan_id" {
  value = azurerm_app_service_plan.example.id
}
