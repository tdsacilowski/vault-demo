resource "azurerm_network_interface" "vault-demo-nic" {
  name                = "VaultNIC"
  location            = "eastus"
  resource_group_name = "${azurerm_resource_group.vault-demo-rg.name}"

  ip_configuration {
    name                          = "VaultNicConfiguration"
    subnet_id                     = "${azurerm_subnet.vault-demo-subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.vault-demo-publicip.id}"
  }

  tags {
    environment = "Vault Demo"
  }
}

resource "azurerm_virtual_machine" "vault-demo-vm" {
  name                  = "VaultVM"
  location              = "eastus"
  resource_group_name   = "${azurerm_resource_group.vault-demo-rg.name}"
  network_interface_ids = ["${azurerm_network_interface.vault-demo-nic.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "myvm"
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/azureuser/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3Nz{snip}hwhqT9h"
    }
  }

  # boot_diagnostics {
  #     enabled     = "true"
  #     storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
  # }

  tags {
    environment = "Vault Demo"
  }
}
