module "resource_group" {
  source = "../../Modules/resource_group"

  rg_info = var.rg_info
}

module "virtual_network" {
  source = "../../Modules/virtual_network"

  vnet_info = var.vnet_info
  rg_name   = module.resource_group.rg_name
  location  = module.resource_group.location
}

module "subnet" {
  source = "../../Modules/Subnet"

  subnet_info = var.subnet_info
  rg_name     = module.resource_group.rg_name
  vnet_name   = module.virtual_network.vnet_name
}

module "network_security_group" {
  source = "../../Modules/Network_Security_Group"

  rg_name   = module.resource_group.rg_name
  location  = module.resource_group.location
  nsg_info  = var.nsg_info
  nsg_rules = var.nsg_rules
  subnet_id = module.subnet.vm_subnet_id
}

module "nat_gateway" {
  source = "../../Modules/Nat Gateway"

  rg_name          = module.resource_group.rg_name
  location         = module.resource_group.location
  subnet_id        = module.subnet.vm_subnet_id
  public_ip_name   = var.nat_info.public_ip_name
  nat_gateway_name = var.nat_info.nat_gateway_name
}

module "network_interface" {
  source = "../../Modules/network_interface"

  rg_name   = module.resource_group.rg_name
  location  = module.resource_group.location
  subnet_id = module.subnet.vm_subnet_id
  nic_info  = var.nic_info
}

module "virtual_machine" {
  source = "../../Modules/virtual_machine"

  rg_name  = module.resource_group.rg_name
  location = module.resource_group.location
  nic_ids  = module.network_interface.nic_ids
  vm_info  = var.vm_info
}

module "bastion" {
  source = "../../Modules/bastion"

  rg_name        = module.resource_group.rg_name
  location       = module.resource_group.location
  subnet_id      = module.subnet.bastion_subnet_id
  public_ip_name = var.bastion_info.public_ip_name
  bastion_name   = var.bastion_info.bastion_name
}

/*module "application_gateway" {
  //source = "../../Modules/applicationGateWay"

  rg_name          = module.resource_group.rg_name
  location         = module.resource_group.location
  subnet_id        = module.subnet.appgw_subnet_id
  app_gateway_info = var.app_gateway_info
  private_ips      = module.network_interface.private_ips
}*/