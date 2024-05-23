param location string 
targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-rg'
  location: location
}

module appserviceplan './app-service-plan.bicep'= {
  scope: resourceGroup
  name: 'bicep-app-plan'
  params: {
    location: resourceGroup.location
  }
}
module  appservice './web-app-plan.bicep'= {
  scope: resourceGroup
  name: 'bicep-webapp'
  params: {
    appServicePlanId: appserviceplan.outputs.appserviceplanid
    location: resourceGroup.location
  }
}
