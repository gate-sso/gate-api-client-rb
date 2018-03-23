require "gate_api_client/version"

require 'ostruct'
require 'gate_api_client/configuration'
require 'gate_api_client/nss_host/nss_host'
require 'gate_api_client/nss_host/nss_host_parser'
require 'gate_api_client/nss_host/invalid_nss_host'

module GateApiClient
  CONNECTION_REFUSED  = 'ECONNREFUSED'
  SERVER_DOWN_HTTP_STATUS_CODES = [500, 501, 502, 503, 504]
  CLIENT_ERROR_HTTP_STATUS_CODES = [400, 401, 404, 422, 406]
end
