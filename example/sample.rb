require 'bitbucket/hooks'
require 'pp'

hooks = Bitbucket::Hooks.set do |hook|
  hook.port = 4567
  hook.on_push do |request|
    pp request
  end
end

Rack::Handler::WEBrick.run(hooks.server, :Port => hooks.port)
