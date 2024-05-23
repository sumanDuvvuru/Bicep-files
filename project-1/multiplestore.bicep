param prefix string='pods'
var regions = [
  'eastus'
  'westus'
  'northeurope'
]


resource storageAccountA'Microsoft.Storage/storageAccounts@2021-02-01' = [for (region,i) in regions:{
  name: '${prefix}${i}storage'
  location: region
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}]
