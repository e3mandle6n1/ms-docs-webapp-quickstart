metadata description = 'Creates an Azure Container Instance that runs a container image from ACR.'

param name string
param location string = resourceGroup().location
param tags object = {}

param containerImage string
param containerName string = 'web'
param containerPort int = 8000
param dnsNameLabel string
param identityId string

param cpuCores int = 1
param memoryInGb string = '1.5'

resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: name
  location: location
  tags: tags
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identityId}': {}
    }
  }
  properties: {
    osType: 'Linux'
    restartPolicy: 'Always'
    ipAddress: {
      type: 'Public'
      dnsNameLabel: dnsNameLabel
      ports: [
        {
          protocol: 'TCP'
          port: containerPort
        }
      ]
    }
    containers: [
      {
        name: containerName
        properties: {
          image: containerImage
          ports: [
            {
              protocol: 'TCP'
              port: containerPort
            }
          ]
          resources: {
            requests: {
              cpu: cpuCores
              memoryInGB: json(memoryInGb)
            }
          }
        }
      }
    ]
  }
}

output fqdn string = containerGroup.properties.ipAddress.fqdn
output ipAddress string = containerGroup.properties.ipAddress.ip
output name string = containerGroup.name
output uri string = 'http://${containerGroup.properties.ipAddress.fqdn}:${containerPort}'
