
require 'chef/mixins'
require 'bundler/setup'
# require 'azure'

require 'azure/connection'
require 'azure/deploy'

KnifeAzureConnection = Azure::Connection
KnifeAzureDeploy     = Azure::Deploy


app_path                       = '/Users/rene/dv/dma'
management_certificate_location= %Q{#{app_path}/shared/azure_cert.pem}
management_certificate         = File.open(management_certificate_location, 'rb') { |f| f.read }
api_hostname                   = 'management.core.windows.net'
subscription_id                = 'de4163b1-0e37-4313-af3a-28e51b7e32f9'
storage_name                   = 'storagexyzsd'


knife_azure_connection = KnifeAzureConnection.new(
  azure_subscription_id: subscription_id,
  azure_mgmt_cert:       management_certificate,
  azure_api_host_name:   api_hostname,
)

knife_azure_deploy = KnifeAzureDeploy.new(knife_azure_connection)

xml_response = knife_azure_connection.query_azure("storageservices/operations/isavailable/#{storage_name}")

puts xml_response






