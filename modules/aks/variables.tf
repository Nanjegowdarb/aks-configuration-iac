variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for AKS"
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
  description = "Log Analytics configuration"
  type = object({
    sku               = string
    retention_in_days = number
  })
}
