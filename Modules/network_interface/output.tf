output "nic_ids" {
  value = {
    for k, v in azurerm_network_interface.nic :
    k => v.id
  }
}

output "private_ips" {
  value = {
    for k, v in azurerm_network_interface.nic :
    k => v.private_ip_address
  }
}