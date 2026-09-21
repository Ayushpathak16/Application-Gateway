variable "vnet_info" {

  type = object({

    name = string

    address_space = list(string)

  })

}

variable "rg_name" {

  type = string

}

variable "location" {

  type = string

}