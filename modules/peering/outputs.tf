
output "peering_ids" {
  description = "IDs of the VNet peerings"

  value = {
    for key, peering in azurerm_virtual_network_peering.vnet_peering :
    key => peering.id
  }
}

output "peering_names" {
  description = "Names of the VNet peerings"

  value = {
    for key, peering in azurerm_virtual_network_peering.vnet_peering :
    key => peering.name
  }
}