# Define outputs for the service plan module if needed
output "service_plan_sku" {
  value = azurerm_app_service_plan.example.sku[0].tier
}

output "service_plan_capacity" {
  value = azurerm_app_service_plan.example.number_of_workers
}
