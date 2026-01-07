resource appVnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: 'LL-Demo-VNet01'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.1.0/24'
      ]
    }
    subnets: [
      {
        name: 'web-subnet'
        properties: {
          addressPrefix: '10.0.1.0/26'
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.1.64/26'
        }
      }
    ]
  }
}

// create vnet app2vnet with an address space of 10.0.2.0/24 
resource App2Vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: 'LL-Demo-VNet02'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.2.0/24'
      ]
    }
    subnets: [
      {
        name: 'web-subnet'
        properties: {
          addressPrefix: '10.0.2.0/26'
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.64/26'
        }
      }
    ]
  }
}

// create a vnet called HubVnet with an address space of 10.0.0.0/24
resource HubVnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: 'LL-Demo-Hub-VNet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/24'
      ]
    }
    subnets: []
  }
}

// create a gateway subnet with 10.0.0.0/26 and attach to the HubVnet
resource HubGatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: 'GatewaySubnet'
  parent: HubVnet
  properties: {
    addressPrefix: '10.0.0.0/26'
  }
}

// create a router subnet with 10.0.0.64/26 and attach to the HubVnet
resource HubRouterSubnet 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: 'RouteServerSubnet'
  parent: HubVnet
  properties: {
    addressPrefix: '10.0.0.64/26'
  }
}
