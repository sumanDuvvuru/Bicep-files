param location string 
param pAPPServiceplan string
param pAPPService string
param pAPPInsights string
param PSQLServer string
module Appserviceplan '2.Appserviceplan.bicep' = {
  name: 'Appserviceplan'
  params:{
    location:location
    pAPPService:pAPPService
    pAPPServiceplan:pAPPServiceplan
    pInstrumentation:AppInsights.outputs.oInstrumentationkey
  }
}
module SQLDatabase '3.SQLDatabase.bicep'= {
  name:  'SQLDatabase'
  params:{
    location:location
    PSQLServer:PSQLServer
  }
}

module AppInsights '4.Appinsights.bicep'={
  name: 'AppInsights'
   params:{
    location:location
    pAPPInsights:pAPPInsights
   }
}
