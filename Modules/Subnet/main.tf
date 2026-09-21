resource "azurerm_subnet" "subnet" {

  for_each = var.subnet_info

  name = each.value.name

  resource_group_name = var.rg_name

  virtual_network_name = var.vnet_name

  address_prefixes = each.value.address_prefixes

}