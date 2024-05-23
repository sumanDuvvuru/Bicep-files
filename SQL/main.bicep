resource keyvault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: 'key-valuts-secrets'
}
module sql 'sql.bicep'= {
  name: 'mysql125-25'
  params: {
    administratorLoginPassword: keyvault.getSecret('sqlpass')
    location: 'eastus'
  }
}
