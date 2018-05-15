module GateApiClient
  class ApiResourceAuthentication
    attr_reader :result

    def initialize(result)
      @result = result
    end

    def autheticated?
      return @result == 0 ? true : false
    end

    def self.uri(api_key, access_token)
      GateApiClient.configuration.generate_uri(GateApiClient.configuration.api_resource_auth_path + "/#{api_key}/#{access_token}")
    end

    def self.uri_as_string
      uri.to_s
    end

    def self.headers
      {"Content-Type" => "application/json" }
    end

    def self.authenticate(api_key, access_token)
      response = request(api_key, access_token)

      ApiResourceAuthentication.new(JSON.parse(response.body)["result"])
    end

    class << self
      private
      def request(api_key, access_token)
        begin
          ApiResourceAuthentication.uri(api_key, access_token).get
        rescue Errno::ECONNREFUSED
          { "status" => CONNECTION_REFUSED }
        end
      end
    end
  end
end

