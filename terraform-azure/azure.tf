provider "azurerm" {
  // Credentials set via env vars
}

resource "azurerm_resource_group" "vault-demo-rg" {
  name     = "TeddyVaultDemoResourceGroup072018"
  location = "eastus"

  tags {
    environment = "Vault Demo"
  }
}
