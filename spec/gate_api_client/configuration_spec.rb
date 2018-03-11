require 'spec_helper'

module GateApiClient
  describe Configuration do
    let(:configuration) { Configuration.new }

    it 'can set gate_host' do
      expected_host = 'http://localhost:3000'
      configuration.gate_host = expected_host

      expect(configuration.gate_host).to eq(expected_host)
    end
  end
end
