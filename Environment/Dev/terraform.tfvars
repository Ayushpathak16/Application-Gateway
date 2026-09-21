rg_info = {
  name     = "rg-application"
  location = "Central India"
}

vnet_info = {
  name = "application-vnet"

  address_space = [
    "10.0.0.0/16"
  ]
}

subnet_info = {

  vm_subnet = {
    name = "vm-subnet"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }

  bastion_subnet = {
    name = "AzureBastionSubnet"

    address_prefixes = [
      "10.0.2.0/26"
    ]
  }

  appgw_subnet = {
    name = "appgw-subnet"

    address_prefixes = [
      "10.0.3.0/24"
    ]
  }

}

nsg_info = {
  name = "vm-subnet-nsg"
}

nsg_rules = {

  http = {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  https = {
    name                       = "Allow-HTTPS"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

nat_info = {
  public_ip_name   = "nat-public-ip"
  nat_gateway_name = "nat-gateway"
}

nic_info = {

  vm1 = {
    name          = "nic-vm1"
    ipconfig_name = "ipconfig1"
  }

  vm3 = {
    name          = "nic-vm3"
    ipconfig_name = "ipconfig1"
  }

}

vm_info = {

  vm1 = {
    name            = "Netflix-vm1"
    computer_name   = "Netflix-vm1"
    website         = "Netflix"

    size = "Standard_B1s"

    admin_username = "ayushadmin"
    admin_password = "aYush@790546"
  }

  vm3 = {
    name            = "Starbucks-vm1"
    computer_name   = "Starbucks-vm1"
    website         = "Starbucks"

    size = "Standard_B1s"

    admin_username = "ayushadmin"
    admin_password = "aYush@790546"
  }

}

bastion_info = {
  public_ip_name = "bastion-public-ip"
  bastion_name   = "azure-bastion"
}

app_gateway_info = {

  name               = "app-gateway"

  sku_name           = "Standard_v2"

  sku_tier           = "Standard_v2"

  capacity           = 2

  public_ip_name     = "appgw-public-ip"

  frontend_port_name = "frontend-port"

  frontend_ip_name   = "frontend-ip"

  gateway_ip_name    = "gateway-ip"

}