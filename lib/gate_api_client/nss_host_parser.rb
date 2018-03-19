module GateApiClient
  class NSSHostParser
    def self.parse(response)
      if response.code == "200" && valid_json?(response.body)
        json_response_body = JSON.parse(response.body)

        if !json_response_body.empty?
          return NSSHost.new(JSON.parse(response.body)["access_key"])
        end
      end
      InvalidNSSHost.new("Bad Response")
    end

    class << self
      private
      def valid_json?(json)
        !!JSON.parse(json)
      rescue JSON::ParserError => _e
        false
      end
    end
  end
end
