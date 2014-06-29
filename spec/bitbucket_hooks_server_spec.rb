require "spec_helper"
require "rack/test"
require "bitbucket/hooks"

def app
  event = Bitbucket::Hooks::Event.new
  Bitbucket::Hooks::Server.new(event)
end

describe 'Bitbucket::Hooks::Server' do
  include Rack::Test::Methods

  describe 'GET' do
    it '400 BAD REQUEST' do
      get '/'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to   eq('BAD REQUEST')
    end
  end

  describe 'POST' do
    describe 'lack request params' do
      it '400 BAD REQUEST' do
        post '/'
        expect(last_response.status).to  eq(400)
        expect(last_response.body).to  eq('BAD REQUEST')
      end
    end

    describe 'have payload params' do
      it '200 OK' do

        post '/', {payload: {hoge: ""}}
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("OK")
      end
    end
  end
end
