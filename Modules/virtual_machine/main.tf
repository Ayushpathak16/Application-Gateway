resource "azurerm_linux_virtual_machine" "vm" {

  for_each = var.vm_info

  name                = each.value.name
  computer_name       = each.value.computer_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = each.value.size

  admin_username = each.value.admin_username

  disable_password_authentication = false

  admin_password = each.value.admin_password

  network_interface_ids = [
    var.nic_ids[each.key]
  ]

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "Canonical"
    offer      = "ubuntu-24_04-lts"
    sku        = "server"
    version    = "latest"

  }

}