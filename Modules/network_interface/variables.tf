variable "rg_name" {

  type = string

}

variable "location" {

  type = string

}

variable "subnet_id" {

  type = string

}

variable "nic_info" {

  type = map(object({

    name          = string
    ipconfig_name = string

  }))

}