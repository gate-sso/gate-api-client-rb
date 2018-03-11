require 'bundler/setup'
Bundler.setup

require 'gate_api_client'

GateApiClient.configure do |config|
  config.gate_host = 'http://localhost:3000'
end
