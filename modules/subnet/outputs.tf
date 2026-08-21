
output "subnet_ids" {
  description = "IDs of the Azure subnets"

  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}

output "subnet_names" {
  description = "Names of the Azure subnets"

  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.name
  }
}