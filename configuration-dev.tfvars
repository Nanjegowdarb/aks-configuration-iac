resource_group_name = "demo-resource-group"
location            = "East US"
vnet_name           = "demo-vnet"
subnet_name         = "aks-demo-subnet"
route_table_name    = "aks-route-table"

vnet_address_space      = ["10.200.0.0/16"]
subnet_address_prefixes = ["10.200.1.0/24"]

routes = [
  {
    name           = "default-route"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }
]

aks_config = {
  cluster_name   = "demo-aks-cluster"
  dns_prefix     = "demo-aks-cluster"
  node_count     = 1
  vm_size        = "Standard_B2ms"
  network_plugin = "azure"
  network_policy = "calico"
}

log_analytics_config = {
  sku               = "PerGB2018"
  retention_in_days = 30
}
