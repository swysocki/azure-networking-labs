terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  description = "The Azure region where the resources will be created"
  default     = "East US"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "AZ-Networking-Labs-RG"
  type        = string
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Hub Virtual Network
resource "azurerm_virtual_network" "hub_vnet" {
  name                = "HubVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# East Spoke Virtual Network
resource "azurerm_virtual_network" "spoke_east_vnet" {
  name                = "SpokeEast"
  address_space       = ["192.168.1.0/24"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# West Spoke Virtual Network
resource "azurerm_virtual_network" "spoke_west_vnet" {
  name                = "SpokeWest"
  address_space       = ["192.168.99.0/24"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
