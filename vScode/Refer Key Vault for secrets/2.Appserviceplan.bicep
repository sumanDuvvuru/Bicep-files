
param location string = 'eastus'
param pAPPServiceplan string= 'azbicep-dev-eus-asp1'
param pAPPService string= 'azbicep-dev-eus-wap1'
param pInstrumentation string 
resource azbicepasp1 'Microsoft.Web/serverfarms@2023-12-01'= {
  name:pAPPServiceplan
  location: location
  sku:{
    name: 'B1'
    capacity:1
  }
}
resource azbicepas 'Microsoft.Web/sites@2021-01-15' = {
  name: pAPPService
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
resource azbicepwebapp1appsetting 'Microsoft.Web/sites/config@2023-12-01'={
  name: 'web'
  parent:azbicepas
  properties:{
    appSettings:[
      {
        name:'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: pInstrumentation
      }
      {
        name:'key2'
        value:'value2'
      }
    ]
  }
}





