require 'spec_helper'

module GateApiClient
  describe ApiResourceAuthentication do
    context '.authenticate' do
      let(:api_key) { 'random_key' }
      let(:access_token) { 'random_token' }
      let(:response_body) { {"result":0 }.to_json }

      it 'should authenticate user' do
        stub_request(:get, "#{GateApiClient.configuration.gate_host}/api_resource/authenticate/#{api_key}/#{access_token}").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(body: response_body, headers: {'Content-Type' => 'application/json'}, status: 200)

        api_resource_authentication = ApiResourceAuthentication.authenticate(api_key, access_token)

        expect(api_resource_authentication).to be_an_instance_of(ApiResourceAuthentication)
        expect(api_resource_authentication.autheticated?).to eq(true)
      end
    end
  end
end

