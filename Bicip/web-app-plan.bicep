param location string
param appServicePlanid string
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'bicep-webapp'
  location: location
  properties: {
    serverFarmId: appServicePlanid
  }
}
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'name'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: 'webServerFarms.id'
  }
}
