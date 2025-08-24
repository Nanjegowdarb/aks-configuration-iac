provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "networking" {
  source                  = "./modules/networking"
  resource_group_name     = module.resource_group.resource_group_name
  location                = var.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  routes                  = var.routes
  route_table_name        = var.route_table_name


}

module "aks" {
  source               = "./modules/aks"
  log_analytics_config = var.log_analytics_config
  aks_config           = var.aks_config
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  subnet_id            = module.networking.aks_subnet_id

}
