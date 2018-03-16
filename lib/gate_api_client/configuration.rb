module GateApiClient
  class Configuration
    def initialize
      @configuration = OpenStruct.new
    end

    def gate_host
      @configuration.gate_host
    end

    def gate_host=(gate_uri_string)
      @configuration.gate_host = gate_uri_string
    end

    def api_token
      @configuration.api_token
    end

    def api_token=(api_token_string)
      @configuration.api_token = api_token_string
    end

    def nss_host_path
      @configuration.booking_path
    end

    def nss_host_path=(nss_host_path_string)
      @configuration.booking_path = nss_host_path_string
    end

    def generate_uri(path)
      @configuration.gate_host.to_uri[path]
    end
  end

  def self.configuration
    @configuration ||= initialize_configuration!
  end

  def self.configure
    config = initialize_configuration!
    yield(config)
    config
  end

  def self.initialize_configuration!
    @configuration = Configuration.new
    @configuration.nss_host_path = '/nss/host'
    @configuration
  end
end
