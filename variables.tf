variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "aks_config" {
  description = "AKS cluster-specific configuration"
  type = object({
    cluster_name   = string
    dns_prefix     = string
    node_count     = number
    vm_size        = string
    network_plugin = string
    network_policy = string
  })
}

variable "log_analytics_config" {
  description = "Configuration settings for Log Analytics integration with the AKS cluster."
  type = object({
    sku               = string
    retention_in_days = number
  })
}

variable "vnet_address_space" {
  description = "List of address spaces to assign to the Virtual Network."
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet within the virtual network used by the AKS cluster."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "List of address prefixes to assign to the AKS subnet."
  type        = list(string)
}

variable "route_table_name" {
  description = "Name of the route table to associate with the subnet."
  type        = string
}

variable "routes" {
  description = "List of custom route definitions to be applied to the subnet via a route table."
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string
  }))
}