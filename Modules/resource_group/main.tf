resource "azurerm_resource_group" "rg" {

  name     = var.rg_info.name
  location = var.rg_info.location

}