param location string 
param PAppserviceName string
param PAppservice string 
param PAppinsights string 
param PSQLServer string
param padministratorLogin string
@secure()
param padministratorpassword string
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
    padministratorpassword:padministratorpassword
  }
}
module Appinsights 'appinsights.bicep'= {
  name: 'Appinsights'
  params: {
     PAppinsights: PAppinsights
  }
}
