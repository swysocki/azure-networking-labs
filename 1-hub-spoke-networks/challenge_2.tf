# East Subnet - Provides a dedicated subnet for VMs within the East Spoke
# Using a /26 subnet allows for up to 59 usable IPs (64 - 5 reserved by Azure)
resource "azurerm_subnet" "east_vm_subnet" {
  name                 = "VMSubnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.spoke_east_vnet.name
  address_prefixes     = ["192.168.1.0/26"]
}

# West Subnet - Provides a dedicated subnet for VMs within the West Spoke
# Using a /26 subnet allows for up to 59 usable IPs (64 - 5 reserved by Azure)
resource "azurerm_subnet" "west_vm_subnet" {
  name                 = "VMSubnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.spoke_west_vnet.name
  address_prefixes     = ["192.168.99.0/26"]
}
