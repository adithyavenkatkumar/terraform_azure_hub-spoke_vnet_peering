

# RESOURCE GROUPS
module "resource_groups" {
  source = "./modules/resource-group"

  resource_groups = {
    hub = {
      name     = var.hub_rg_name
      location = var.hub_location
    }

    web = {
      name     = var.web_rg_name
      location = var.web_location
    }

    app = {
      name     = var.app_rg_name
      location = var.app_location
    }
  }
}


   
# VIRTUAL NETWORKS
module "vnets" {
  source = "./modules/vnet"

  virtual_networks = {
    hub = {
      vnet_name           = var.hub_vnet_name
      location            = var.hub_location
      resource_group_name = module.resource_groups.resource_group_names["hub"]
      address_space       = var.hub_vnet_address_space
    }

    web = {
      vnet_name           = var.web_vnet_name
      location            = var.web_location
      resource_group_name = module.resource_groups.resource_group_names["web"]
      address_space       = var.web_vnet_address_space
    }

    app = {
      vnet_name           = var.app_vnet_name
      location            = var.app_location
      resource_group_name = module.resource_groups.resource_group_names["app"]
      address_space       = var.app_vnet_address_space
    }
  }

  depends_on = [
    module.resource_groups
  ]
}


   
# SUBNETS
module "subnets" {
  source = "./modules/subnet"

  subnets = {
    gateway = {
      subnet_name          = "GatewaySubnet"
      resource_group_name  = module.resource_groups.resource_group_names["hub"]
      virtual_network_name = module.vnets.virtual_network_names["hub"]
      address_prefixes     = [var.gateway_subnet_prefix]
    }

    firewall = {
      subnet_name          = "AzureFirewallSubnet"
      resource_group_name  = module.resource_groups.resource_group_names["hub"]
      virtual_network_name = module.vnets.virtual_network_names["hub"]
      address_prefixes     = [var.firewall_subnet_prefix]
    }

    web = {
      subnet_name          = "web-subnet"
      resource_group_name  = module.resource_groups.resource_group_names["web"]
      virtual_network_name = module.vnets.virtual_network_names["web"]
      address_prefixes     = [var.web_subnet_prefix]
    }

    app = {
      subnet_name          = "app-subnet"
      resource_group_name  = module.resource_groups.resource_group_names["app"]
      virtual_network_name = module.vnets.virtual_network_names["app"]
      address_prefixes     = [var.app_subnet_prefix]
    }
  }

  depends_on = [
    module.vnets
  ]
}


   
# VNET PEERINGS
module "vnet_peering" {
  source = "./modules/peering"

  vnet_peerings = {

         
    # Hub → Web   
    hub_to_web = {
      vnet_peering_name         = "hub-to-web"
      resource_group_name       = module.resource_groups.resource_group_names["hub"]
      virtual_network_name      = module.vnets.virtual_network_names["hub"]
      remote_virtual_network_id = module.vnets.virtual_network_ids["web"]

      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }


         
    # Web → Hub
    web_to_hub = {
      vnet_peering_name         = "web-to-hub"
      resource_group_name       = module.resource_groups.resource_group_names["web"]
      virtual_network_name      = module.vnets.virtual_network_names["web"]
      remote_virtual_network_id = module.vnets.virtual_network_ids["hub"]

      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }


         
    # Hub → App
    hub_to_app = {
      vnet_peering_name         = "hub-to-app"
      resource_group_name       = module.resource_groups.resource_group_names["hub"]
      virtual_network_name      = module.vnets.virtual_network_names["hub"]
      remote_virtual_network_id = module.vnets.virtual_network_ids["app"]

      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }


         
    # App → Hub
    app_to_hub = {
      vnet_peering_name         = "app-to-hub"
      resource_group_name       = module.resource_groups.resource_group_names["app"]
      virtual_network_name      = module.vnets.virtual_network_names["app"]
      remote_virtual_network_id = module.vnets.virtual_network_ids["hub"]

      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }
  }

  depends_on = [
    module.vnets,
    module.subnets
  ]
}