resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_route_table" "aks_route_table" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "route" {
    for_each = var.routes
    content {
      name           = route.value.name
      address_prefix = route.value.address_prefix
      next_hop_type  = route.value.next_hop_type
    }
  }
}

resource "azurerm_subnet_route_table_association" "aks_route_table_association" {
  subnet_id      = azurerm_subnet.aks_subnet.id
  route_table_id = azurerm_route_table.aks_route_table.id
}
