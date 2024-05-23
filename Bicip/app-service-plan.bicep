param location string = 'westus'
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'bicep-app'
  location: location
  sku: {
    name: 'B1'
    capacity: 1
  }
}
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'bicep-web-app'
  location: location
 
  properties: {
    serverFarmId: appServicePlan.id
  }
}
