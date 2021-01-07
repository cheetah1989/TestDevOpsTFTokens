provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name = "tf_rgblobstorage"
    storage_account_name = "tfstatechetan"
    container_name = "tfstatechetan"
    key = "terraform.tfstate"
  }
}
  resource "azurerm_resource_group" "tfstaticweb" {
        name     = "tfstaticweb"
        location = "eastus2"
    }

  resource "azurerm_storage_account" "tfstaticstorage" {
        name                     = "staticstorechetan"
        resource_group_name      = azurerm_resource_group.tfstaticweb.name
        location                 = azurerm_resource_group.tfstaticweb.location
        account_tier             = "Standard"
        account_replication_type = "LRS"
        allow_blob_public_access = true
         static_website {
             index_document = "index.html"
         }
    }

