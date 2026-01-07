# Hub and Spoke Network

## Challenge 1

Create a traditional Azure hub and spoke design using 3 Virtual Networks. There will be a Hub, and an East and West Spoke.

Use Terraform to create all resources. No local state.

### Resource Group

- Name: AZ-Networking-Labs-RG

### Hub Virtual Network

- Name: HubVNet
- Address Space: 10.0.0.0/16

### Spoke Virtual Networks

#### East VNet

- Name: SpokeEast
- Address Space: 192.168.1.0/24

#### West VNet

- Name: SpokeWest
- Address Space: 192.168.99.0/24

## Challenge 2

Add subnets to each spoke's virtual network in a separate Terraform file.

### East Subnet

- name: VMSubnet1
- Subnet: 192.168.1.0/26

### West Subnet

- name: VMSubnet1
- Subnet: 192.168.99.0/26
