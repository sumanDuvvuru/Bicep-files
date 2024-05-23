param location string
@secure()
param administratorLoginPassword string
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: 'mysql125-25'
  location: location
  properties:{
    administratorLogin:'sqladmin'
    administratorLoginPassword:administratorLoginPassword
  }

}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: 'Mydb'
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}
