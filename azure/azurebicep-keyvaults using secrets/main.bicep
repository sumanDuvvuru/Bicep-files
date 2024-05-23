param location string 
param PAppserviceName string
param PAppservice string 
param PAppinsights string 
param PSQLServer string
param padministratorLogin string
@secure()
param padministratorpassword string
resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: 'key-valuts-secrets'

}
module AppservicePlan 'appserviceplan.bicep'={
  name: 'Appservice'
  params:{
    location:location
    PAppservice:PAppservice
    PAppserviceName:PAppserviceName
    pInstrumentationkey: Appinsights.outputs.oInstrumentationKey
     
  }
}
module SQLDatabase 'sqlserver.bicep'={
  name: 'sqldatabase'
  params:{
    location:location
    PSQLServer:PSQLServer
    padministratorLogin:padministratorLogin
    padministratorpassword:keyVault.getSecret('Adminpassword')
  }
}
module Appinsights 'appinsights.bicep'= {
  name: 'Appinsights'
  params: {
     PAppinsights: PAppinsights
  }
}
