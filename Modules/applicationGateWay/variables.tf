variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_ips" {
  type = map(string)
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