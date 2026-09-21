resource "azurerm_public_ip" "nat_pip" {

  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name

  allocation_method = "Static"

  sku = "Standard"

}

resource "azurerm_nat_gateway" "nat" {

  name                = var.nat_gateway_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = "Standard"

}

resource "azurerm_nat_gateway_public_ip_association" "association" {

  nat_gateway_id       = azurerm_nat_gateway.nat.id

  public_ip_address_id = azurerm_public_ip.nat_pip.id

}

resource "azurerm_subnet_nat_gateway_association" "association" {

  subnet_id = var.subnet_id

  nat_gateway_id = azurerm_nat_gateway.nat.id

}