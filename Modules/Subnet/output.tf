output "subnet_ids" {

  value = {

    for k, v in azurerm_subnet.subnet :

    k => v.id

  }

}

output "subnet_names" {

  value = {

    for k, v in azurerm_subnet.subnet :

    k => v.name

  }

}

output "vm_subnet_id" {

  value = azurerm_subnet.subnet["vm_subnet"].id

}

output "bastion_subnet_id" {

  value = azurerm_subnet.subnet["bastion_subnet"].id

}

output "appgw_subnet_id" {

  value = azurerm_subnet.subnet["appgw_subnet"].id

}