variable "rg_info" {
  type = object({
    name     = string
    location = string
  })
}

variable "vnet_info" {
  type = object({
    name          = string
    address_space = list(string)
  })
}

variable "subnet_info" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "nsg_info" {
  type = object({
    name = string
  })
}

variable "nsg_rules" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "nat_info" {
  type = object({
    public_ip_name   = string
    nat_gateway_name = string
  })
}

variable "nic_info" {
  type = map(object({
    name          = string
    ipconfig_name = string
  }))
}

variable "vm_info" {
  type = map(object({
    name            = string
    computer_name   = string
    website         = string
    size            = string
    admin_username  = string
    admin_password  = string
  }))
}

variable "bastion_info" {
  type = object({
    public_ip_name = string
    bastion_name   = string
  })
}

variable "app_gateway_info" {
  type = object({
    name               = string
    sku_name           = string
    sku_tier           = string
    capacity           = number
    public_ip_name     = string
    frontend_port_name = string
    frontend_ip_name   = string
    gateway_ip_name    = string
  })
}