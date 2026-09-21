variable "rg_name" {

  type = string

}

variable "location" {

  type = string

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
variable "subnet_id" {
  type = string
}