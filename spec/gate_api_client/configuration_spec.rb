require 'spec_helper'

module GateApiClient
  describe Configuration do
    let(:configuration) { Configuration.new }

    it 'can set gate_host' do
      expected_host = 'http://localhost:3000'
      configuration.gate_host = expected_host

      expect(configuration.gate_host).to eq(expected_host)
    end

    describe '.configure' do
      subject do
        configuration = GateApiClient.configure do |config|
          config.gate_host = 'http://localhost:3000'
        end
      end
      it { is_expected.to be_instance_of(described_class) }
      it { expect(subject.gate_host).to eq('http://localhost:3000') }
      it { expect(subject.nss_host_path).to eq('/nss/host') }
    end
  end
end
