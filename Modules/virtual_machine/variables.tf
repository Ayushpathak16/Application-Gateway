variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nic_ids" {
  type = map(string)
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