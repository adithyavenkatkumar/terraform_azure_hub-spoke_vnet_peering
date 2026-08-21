
output "resource_group_ids" {
  description = "Resource Group IDs"

  value = {
    for key, rg in azurerm_resource_group.rg :
    key => rg.id
  }
}

output "resource_group_names" {
  description = "Resource Group names"

  value = {
    for key, rg in azurerm_resource_group.rg :
    key => rg.name
  }
}

output "resource_group_locations" {
  description = "Resource Group locations"

  value = {
    for key, rg in azurerm_resource_group.rg :
    key => rg.location
  }
}