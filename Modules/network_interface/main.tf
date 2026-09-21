resource "azurerm_network_interface" "nic" {

  for_each = var.nic_info

  name                = each.value.name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {

  name                          = each.value.ipconfig_name
  subnet_id                     = var.subnet_id
  private_ip_address_allocation = "Dynamic"

}

}