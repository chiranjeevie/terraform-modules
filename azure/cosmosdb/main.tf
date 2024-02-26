resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.service_plan_id

  site_config {
    always_on                 = true
    linux_fx_version         = var.runtime_stack
    app_command_line          = ""
    use_32_bit_worker_process = false

  }

  tags = var.tags
}

output "app_service_id" {
  value = azurerm_app_service.example.id
}
