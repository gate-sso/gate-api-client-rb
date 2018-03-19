require 'spec_helper'

module GateApiClient
  describe InvalidNSSHost do
    let(:errors) { "some random errors" }

    it 'should return false for invalid object' do
      invalid_nss_host = InvalidNSSHost.new(errors)

      expect(invalid_nss_host.valid?).to be false
    end

    it 'should return errors' do
      invalid_nss_host = InvalidNSSHost.new(errors)

      expect(invalid_nss_host.errors).to eq([errors])
    end
  end
end
