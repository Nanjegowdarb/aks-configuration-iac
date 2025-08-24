resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.aks_config.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_config.sku
  retention_in_days   = var.log_analytics_config.retention_in_days
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_config.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_config.dns_prefix

  default_node_pool {
    name           = "default"
    node_count     = var.aks_config.node_count
    vm_size        = var.aks_config.vm_size
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.aks_config.network_plugin
    network_policy = var.aks_config.network_policy
    service_cidr   = null
    dns_service_ip = null
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id
  }

  tags = {
    environment = "demo"
  }
}
