param padministratorLogin string
@secure()
param padministratorpassword string

param location string = 'eastus'
param PSQLServer string= 'azbicep-dev-sqlserver'
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: PSQLServer
  location: location
  properties:{
    administratorLogin:padministratorLogin
    administratorLoginPassword:padministratorpassword
  }
}


resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: sqlServer
  name: 'suman-ip'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  name: 'database'
  parent: sqlServer
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648' // Maximum size in bytes (2 GB)
    requestedServiceObjectiveName: 'Basic'
  }
}
