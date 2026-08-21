
        
# RESOURCE GROUP VARIABLES
variable "hub_rg_name" {
  description = "Name of the Hub Resource Group"
  type        = string
}

variable "web_rg_name" {
  description = "Name of the Web Spoke Resource Group"
  type        = string
}

variable "app_rg_name" {
  description = "Name of the App Spoke Resource Group"
  type        = string
}


        
# LOCATION VARIABLES
variable "hub_location" {
  description = "Azure region for the Hub"
  type        = string
}

variable "web_location" {
  description = "Azure region for the Web Spoke"
  type        = string
}

variable "app_location" {
  description = "Azure region for the App Spoke"
  type        = string
}


        
# VNET NAME VARIABLES
variable "hub_vnet_name" {
  description = "Name of the Hub VNet"
  type        = string
}

variable "web_vnet_name" {
  description = "Name of the Web Spoke VNet"
  type        = string
}

variable "app_vnet_name" {
  description = "Name of the App Spoke VNet"
  type        = string
}


        
# VNET ADDRESS SPACE VARIABLES
variable "hub_vnet_address_space" {
  description = "Address space for the Hub VNet"
  type        = list(string)
}

variable "web_vnet_address_space" {
  description = "Address space for the Web Spoke VNet"
  type        = list(string)
}

variable "app_vnet_address_space" {
  description = "Address space for the App Spoke VNet"
  type        = list(string)
}


        
# SUBNET VARIABLES
variable "gateway_subnet_prefix" {
  description = "Address prefix for GatewaySubnet"
  type        = string
}

variable "firewall_subnet_prefix" {
  description = "Address prefix for AzureFirewallSubnet"
  type        = string
}

variable "web_subnet_prefix" {
  description = "Address prefix for Web subnet"
  type        = string
}

variable "app_subnet_prefix" {
  description = "Address prefix for App subnet"
  type        = string
}