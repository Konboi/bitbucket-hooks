require "spec_helper"
require "rack/test"
require "bitbucket/hooks"


$counter = 0
$string  = ''

def push
  $counter = $counter + 1
end

def push2
  $string = 'hogehoge'
end

describe 'Bitbucket::Hooks' do
  include Rack::Test::Methods

  def app
    hooks = Bitbucket::Hooks.set do |hook|
      hook.on_push do |request|
        push
        push2
      end
    end
    hooks.server
  end

  context 'Post from Bitbucket' do
    it '$counter increment' do
      expect($counter).to eq(0)
      post '/', {payload: {hoge: 'fuga'}}
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("OK")
      expect($counter).to eq(1)
      expect($string).to eq('hogehoge')
    end
  end
end
