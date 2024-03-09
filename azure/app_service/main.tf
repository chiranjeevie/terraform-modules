resource "azurerm_linux_web_app" "example" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    # Configure site settings as needed based on the specified runtime
  }
}