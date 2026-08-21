
output "virtual_network_ids" {
  description = "IDs of the Azure Virtual Networks"

  value = {
    for key, vnet in azurerm_virtual_network.vnet :
    key => vnet.id
  }
}

output "virtual_network_names" {
  description = "Names of the Azure Virtual Networks"

  value = {
    for key, vnet in azurerm_virtual_network.vnet :
    key => vnet.name
  }
}