param PAppinsights string ='azbicep-dev-eus-wapai'
resource azbicepappInsights 'Microsoft.Insights/components@2020-02-02' = {
  name:PAppinsights
  location:resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output oInstrumentationKey string = azbicepappInsights.properties.InstrumentationKey
