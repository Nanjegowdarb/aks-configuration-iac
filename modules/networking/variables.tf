variable "resource_group_name" {
  description = "The name of the Azure Resource Group where all resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the network resources will be deployed."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network (VNet) to be created."
  type        = string
}

variable "vnet_address_space" {
  description = "The list of IP address ranges (CIDR blocks) to be used for the Virtual Network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the Subnet to be created within the Virtual Network."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The list of IP address prefixes (CIDR blocks) to be assigned to the subnet."
  type        = list(string)
}

variable "route_table_name" {
  description = "The name of the Route Table to be created and associated with the subnet."
  type        = string
}

variable "routes" {
  description = "A list of custom routes to be created in the route table. Each route defines a name, address prefix, and next hop type."
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string
  }))
}
