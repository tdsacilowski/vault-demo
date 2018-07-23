resource "azurerm_virtual_network" "vault-demo-network" {
  name                = "VaultVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "${azurerm_resource_group.vault-demo-rg.name}"

  tags {
    environment = "Vault Demo"
  }
}

resource "azurerm_subnet" "vault-demo-subnet" {
  name                 = "VaultSubnet"
  resource_group_name  = "${azurerm_resource_group.vault-demo-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vault-demo-network.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "vault-demo-publicip" {
  name                         = "VaultPublicIP"
  location                     = "eastus"
  resource_group_name          = "${azurerm_resource_group.vault-demo-rg.name}"
  public_ip_address_allocation = "dynamic"

  tags {
    environment = "Vault Demo"
  }
}

resource "azurerm_network_security_group" "vault-demo-nsg" {
  name                = "VaultNetworkSecurityGroup"
  location            = "eastus"
  resource_group_name = "${azurerm_resource_group.vault-demo-rg.name}"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "Vault Demo"
  }
}
