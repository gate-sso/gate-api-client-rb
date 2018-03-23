require 'spec_helper'

module GateApiClient
  describe NSSHost do
    context '.get_nss_host_token' do
      let(:access_key) { 'random_key' }
      let(:hostname) { 'instance_host_name' }
      let(:group_name) { 'sysadmin' }
      let(:created_at) { "2018-03-11T18:03:56.000Z" }
      let(:updated_at) { "2018-03-12T04:23:26.422Z" }
      let(:response_body) { {"id":2980, "name": hostname, "created_at": created_at, "updated_at": updated_at, "api_key":nil, "access_key": access_key }.to_json }

      it 'fetch host specific token' do
        stub_request(:post, "#{GateApiClient.configuration.gate_host}/nss/host?group_name=sysadmin&name=instance_host_name&token=#{GateApiClient.configuration.api_token}").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json'}).
        to_return(body: response_body, headers: {'Content-Type' => 'application/json'}, status: 200)

        nss_host = NSSHost.get_nss_host_token(hostname, group_name)

        expect(nss_host).to be_an_instance_of(NSSHost)
        expect(nss_host.access_key).to eq(access_key)
      end
    end
  end
end
