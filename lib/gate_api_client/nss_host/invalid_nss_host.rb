module GateApiClient
  class InvalidNSSHost
    def initialize(errors)
      @errors = errors
    end

    def valid?
      false
    end

    def errors
      [@errors]
    end
  end
end
