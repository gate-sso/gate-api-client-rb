require 'spec_helper'

module GateApiClient
  describe NSSHostParser do
    let(:access_key) { 'random_key' }
    let(:hostname) { 'instance_host_name' }
    let(:group_name) { 'sysadmin' }
    let(:created_at) { "2018-03-11T18:03:56.000Z" }
    let(:updated_at) { "2018-03-12T04:23:26.422Z" }
    let(:deseralised_response_body) { {"id":2980, "name": hostname, "created_at": created_at, "updated_at": updated_at, "api_key":nil, "access_key": access_key }.to_json }

    context "successfull http response" do
    let(:http_response) { double(Wrest::Native::Response, code: "200", ok?: true, content_type: 'application/json',
                                 body: deseralised_response_body) }
      it 'should return nss_host object for success http response' do
        nss_host = NSSHostParser.parse(http_response)

        expect(nss_host).to be_an_instance_of(NSSHost)
        expect(nss_host.access_key).to eq(access_key)
      end
    end

    context "empty response" do
      let(:empty_http_response) { double(Wrest::Native::Response, code: "200", ok?: true, content_type: 'application/json',
                                 body: "") }
      it 'should return error object for success http response with nil body' do
        nss_host = NSSHostParser.parse(empty_http_response)

        expect(nss_host.errors).to eq(["Bad Response"])
      end
    end

    context "invalid http response" do
      let(:invalid_http_response) { double(Wrest::Native::Response, code: "500", internal_server_error?: true, content_type: 'application/json',
                                 body: "") }
      it 'should return error object with error message' do
        nss_host = NSSHostParser.parse(invalid_http_response)

        expect(nss_host.errors).to eq(["5XX Internal Server Error"])
      end
    end

    context "invalid http response" do
      let(:invalid_http_response) { double(Wrest::Native::Response, code: "400", bad_request?: true, content_type: 'application/json',
                                 body: "") }
      it 'should return error object with error message' do
        nss_host = NSSHostParser.parse(invalid_http_response)

        expect(nss_host.errors).to eq(["4XX Bad Response"])
      end
    end
  end
end

