
variable "virtual_networks" {
  description = "Map of Azure Virtual Networks"

  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}