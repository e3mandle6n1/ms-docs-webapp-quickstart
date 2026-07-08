targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Environment name used for resource naming and tags.')
param environmentName string

@minLength(1)
@description('Primary Azure region for all resources.')
param location string

@description('Optional override for the resource group name.')
param resourceGroupName string = ''

@description('Optional override for the container instance name.')
param containerInstanceName string = ''

@description('Optional override for the public DNS name label.')
param dnsNameLabel string = ''

@description('Name of the Azure Container Registry.')
param acrName string

@description('When true, references an existing ACR instead of creating a new one.')
param useExistingAcr bool = true

@description('Resource group containing the existing ACR. Leave empty when the registry is in the deployment resource group.')
param acrResourceGroupName string = ''

@description('Container image repository name in ACR.')
param containerImageName string = 'fastapi-webapp'

@description('Container image tag in ACR.')
param containerImageTag string = 'latest'

@description('Container port exposed by the application.')
param containerPort int = 8000

var abbrs = loadJsonContent('./abbreviations.json')
var tags = {
  environment: environmentName
  workload: 'fastapi-webapp'
  managedBy: 'azd'
}

var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var resolvedAcrName = acrName
var resolvedDnsNameLabel = !empty(dnsNameLabel) ? dnsNameLabel : '${abbrs.containerInstanceContainerGroups}${resourceToken}'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: !empty(resourceGroupName) ? resourceGroupName : '${abbrs.resourcesResourceGroups}${environmentName}'
  location: location
  tags: tags
}

module acrModule './core/registry/containerregistry.bicep' = if (!useExistingAcr) {
  name: 'registry'
  scope: rg
  params: {
    name: resolvedAcrName
    location: location
    tags: tags
  }
}

resource existingAcrSameRg 'Microsoft.ContainerRegistry/registries@2023-07-01' existing = if (useExistingAcr && empty(acrResourceGroupName)) {
  name: resolvedAcrName
  scope: rg
}

resource existingAcrOtherRg 'Microsoft.ContainerRegistry/registries@2023-07-01' existing = if (useExistingAcr && !empty(acrResourceGroupName)) {
  name: resolvedAcrName
  scope: resourceGroup(acrResourceGroupName)
}


var acrLoginServer = useExistingAcr
  ? (empty(acrResourceGroupName) ? existingAcrSameRg!.properties.loginServer : existingAcrOtherRg!.properties.loginServer)
  : acrModule!.outputs.loginServer
var containerImage = '${acrLoginServer}/${containerImageName}:${containerImageTag}'

module containerIdentity './core/identity/userassignedidentity.bicep' = {
  name: 'container-identity'
  scope: rg
  params: {
    name: '${abbrs.managedIdentityUserAssignedIdentities}${resourceToken}'
    location: location
    tags: tags
  }
}

module acrPullRoleSameRg './core/security/acr-pull-role-assignment.bicep' = if (empty(acrResourceGroupName)) {
  name: 'acr-pull-role'
  scope: rg
  params: {
    principalId: containerIdentity.outputs.principalId
    registryName: resolvedAcrName
  }
}

module acrPullRoleOtherRg './core/security/acr-pull-role-assignment.bicep' = if (!empty(acrResourceGroupName)) {
  name: 'acr-pull-role'
  scope: resourceGroup(acrResourceGroupName)
  params: {
    principalId: containerIdentity.outputs.principalId
    registryName: resolvedAcrName
  }
}

module web './core/host/containerinstance.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: !empty(containerInstanceName) ? containerInstanceName : '${abbrs.containerInstanceContainerGroups}web-${resourceToken}'
    location: location
    tags: union(tags, { 'azd-service-name': 'web' })
    containerImage: containerImage
    containerPort: containerPort
    dnsNameLabel: resolvedDnsNameLabel
    identityId: containerIdentity.outputs.id
    acrLoginServer: acrLoginServer
  }
  dependsOn: [
    acrPullRoleSameRg
    acrPullRoleOtherRg
  ]
}

output AZURE_CONTAINER_REGISTRY_ENDPOINT string = acrLoginServer
output AZURE_CONTAINER_REGISTRY_NAME string = resolvedAcrName
output AZURE_LOCATION string = location
output AZURE_TENANT_ID string = tenant().tenantId
output SERVICE_WEB_FQDN string = web.outputs.fqdn
output SERVICE_WEB_NAME string = web.outputs.name
output SERVICE_WEB_URI string = web.outputs.uri
