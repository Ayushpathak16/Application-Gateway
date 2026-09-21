resource "azurerm_public_ip" "appgw_pip" {
  name                = var.app_gateway_info.public_ip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {

  name                = var.app_gateway_info.name
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    name     = var.app_gateway_info.sku_name
    tier     = var.app_gateway_info.sku_tier
    capacity = var.app_gateway_info.capacity
  }

  gateway_ip_configuration {
    name      = var.app_gateway_info.gateway_ip_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = var.app_gateway_info.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = var.app_gateway_info.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  ####################################################
  # Backend Pools
  ####################################################

 backend_address_pool {

  name = "Netflix-Pool"

  ip_addresses = [
    var.private_ips["vm1"]
  ]

}

backend_address_pool {

  name = "Starbucks-Pool"

  ip_addresses = [
    var.private_ips["vm3"]
  ]

}

  ####################################################
  # Health Probes
  ####################################################

  probe {
    name                = "Netflix-Probe"
    protocol            = "Http"
    path                = "/"
    interval            = 30
    timeout             = 30
    unhealthy_threshold = 3
  }

  probe {
    name                = "Starbucks-Probe"
    protocol            = "Http"
    path                = "/"
    interval            = 30
    timeout             = 30
    unhealthy_threshold = 3
  }

  ####################################################
  # Backend HTTP Settings
  ####################################################

  backend_http_settings {
    name                  = "Netflix-Setting"
    protocol              = "Http"
    port                  = 80
    cookie_based_affinity = "Disabled"
    request_timeout       = 30
    probe_name            = "Netflix-Probe"
  }

  backend_http_settings {
    name                  = "Starbucks-Setting"
    protocol              = "Http"
    port                  = 80
    cookie_based_affinity = "Disabled"
    request_timeout       = 30
    probe_name            = "Starbucks-Probe"
  }

  ####################################################
  # Listeners
  ####################################################

  http_listener {
    name                           = "Netflix-Listener"
    frontend_ip_configuration_name = var.app_gateway_info.frontend_ip_name
    frontend_port_name             = var.app_gateway_info.frontend_port_name
    protocol                       = "Http"
    host_name                      = "netflix.ayushpathak.site"
  }

  http_listener {
    name                           = "Starbucks-Listener"
    frontend_ip_configuration_name = var.app_gateway_info.frontend_ip_name
    frontend_port_name             = var.app_gateway_info.frontend_port_name
    protocol                       = "Http"
    host_name                      = "starbucks.ayushpathak.site"
  }

  ####################################################
  # Routing Rules
  ####################################################

  request_routing_rule {
    name                       = "Netflix-Rule"
    priority                   = 100
    rule_type                  = "Basic"
    http_listener_name         = "Netflix-Listener"
    backend_address_pool_name  = "Netflix-Pool"
    backend_http_settings_name = "Netflix-Setting"
  }

  request_routing_rule {
    name                       = "Starbucks-Rule"
    priority                   = 110
    rule_type                  = "Basic"
    http_listener_name         = "Starbucks-Listener"
    backend_address_pool_name  = "Starbucks-Pool"
    backend_http_settings_name = "Starbucks-Setting"
  }

}