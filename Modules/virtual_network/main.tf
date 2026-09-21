resource "azurerm_virtual_network" "vnet" {

  name = var.vnet_info.name

  resource_group_name = var.rg_name

  location = var.location

  address_space = var.vnet_info.address_space

}