variable "subnet_info" {

  type = map(object({

    name = string

    address_prefixes = list(string)

  }))

}

variable "rg_name" {

  type = string

}

variable "vnet_name" {

  type = string

}