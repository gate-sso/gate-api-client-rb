require 'bundler/setup'
Bundler.setup

require 'gate_api_client'
require 'wrest'
require 'webmock/rspec'

GateApiClient.configure do |config|
  config.gate_host = 'http://localhost'
  config.api_token = 'random'
end
