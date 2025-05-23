resource "azurerm_linux_virtual_machine" "myvm" {
  name                = "nextopslvmt21"
  resource_group_name = azurerm_resource_group.myfirstrg.name
  location            = azurerm_resource_group.myfirstrg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "xxxxxxxxx"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.mynic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {"environment" = "prod"}
}