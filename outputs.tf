
# =========================================================
# RESOURCE GROUP OUTPUTS
# =========================================================

output "resource_group_ids" {
  description = "IDs of all Resource Groups"

  value = module.resource_groups.resource_group_ids
}

output "resource_group_names" {
  description = "Names of all Resource Groups"

  value = module.resource_groups.resource_group_names
}

output "resource_group_locations" {
  description = "Locations of all Resource Groups"

  value = module.resource_groups.resource_group_locations
}


# =========================================================
# VNET OUTPUTS
# =========================================================

output "virtual_network_ids" {
  description = "IDs of all Virtual Networks"

  value = module.vnets.virtual_network_ids
}

output "virtual_network_names" {
  description = "Names of all Virtual Networks"

  value = module.vnets.virtual_network_names
}


# =========================================================
# SUBNET OUTPUTS
# =========================================================

output "subnet_ids" {
  description = "IDs of all subnets"

  value = module.subnets.subnet_ids
}

output "subnet_names" {
  description = "Names of all subnets"

  value = module.subnets.subnet_names
}


# =========================================================
# VNET PEERING OUTPUTS
# =========================================================

output "peering_ids" {
  description = "IDs of all VNet peerings"

  value = module.vnet_peering.peering_ids
}