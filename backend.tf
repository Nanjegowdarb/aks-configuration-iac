terraform {
  backend "azurerm" {
    resource_group_name  = "statefile-storage"
    storage_account_name = "statefiledemo"
    container_name       = "tfstate"
  }
}
