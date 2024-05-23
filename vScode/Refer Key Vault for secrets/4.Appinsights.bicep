
param location string = 'eastus'
param pAPPInsights string='azbicep-dev-eus-wapp1-ai'
resource azbicepappinsights'Microsoft.Insights/components@2020-02-02' = {
  name: pAPPInsights
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
output oInstrumentationkey string = azbicepappinsights.properties.InstrumentationKey
