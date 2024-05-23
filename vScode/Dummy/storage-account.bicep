@description('name of the storageAccount')
param storageAccountName string 
@description( 'location of the storageAccount')
param location string 
@description('The type of storage account')
@allowed([
  'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'StorageV2'
])
param storageAccountKind string = 'StorageV2'
param containerNames array = []
@description('Name of the SKU')
@allowed([
  'Standard_GRS'
  'Standard_LRS'
])
param storageAccountSku string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: storageAccountKind
  sku: {
    name: storageAccountSku
  }
}
resource blobservices 'Microsoft.Storage/storageAccounts/blobServices@2023-04-01'= {
  name: 'default'
  parent: storageAccount
  
}
resource containers 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-04-01'=[for containerName in containerNames: {
   name: containerName
   parent:blobservices
}]
