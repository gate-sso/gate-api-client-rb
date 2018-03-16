module GateApiClient
  class NSSHost
    attr_reader :access_key

    def initialize(access_key)
      @access_key = access_key
    end

    def self.uri
      @uri ||= GateApiClient.configuration.generate_uri(GateApiClient.configuration.nss_host_path)
    end

    def self.uri_as_string
      uri.to_s
    end

    def self.headers
      {"Content-Type" => "application/json" }
    end

    def self.get_nss_host_token(hostname, group_name)
      response = request(hostname, group_name)
      response_body = JSON.parse(response.body)
      NSSHost.new(response_body["access_key"])
    end

    private
    def self.request(hostname, group_name)
      params = { "group_name": group_name, "name": hostname, "token": GateApiClient.configuration.api_token }
      begin
        NSSHost.uri.post('', headers, params)
      rescue Errno::ECONNREFUSED
        { "status" => CONNECTION_REFUSED }
      end
    end
  end
end
