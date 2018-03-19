module GateApiClient
  class NSSHostParser
    def self.parse(response)
      if response.code == 200
        NSSHost.new(JSON.parse(response.body)["access_key"])
      end
    end
  end
end
