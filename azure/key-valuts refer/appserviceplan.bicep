param location string = 'eastus'
param PAppserviceName string= 'azbicep-dev-eus-asp1'
param PAppservice string ='azbicep-dev-eus-wap1'
param pInstrumentationkey string

resource azbicepasp1 'Microsoft.Web/serverfarms@2023-12-01'= {
  name:PAppserviceName
  location: location
  sku: {
    name: 'S1'
    capacity:1
  }
}
resource azbicepas 'Microsoft.Web/sites@2021-01-15' = {
  name: PAppservice
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms','azbicep-dev-eus-asp1')
  }
  dependsOn: [
    azbicepasp1
  ]
}
resource azbicepWebapp1appsetting 'Microsoft.Web/sites/config@2023-12-01'={
  name:'web'
  parent: azbicepas
  properties:{
    appSettings:[
      {
        name:'APPINSIGHTS_INSTRUMENTATIONKEY'
        value : pInstrumentationkey
      }
      {
        name:'key2'
        value:'value2'
      }
    ]
  }
}



