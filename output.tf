 output "url" {
  value = azurerm_app_service.as[*].default_site_hostname
}
 output "url1" {
  value = azurerm_app_service.as1[*].default_site_hostname
}