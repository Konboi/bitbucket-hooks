require 'bitbucket/hooks'
require 'pp'

def puuush
end

hooks = Bitbucket::Hooks.set do |hook|
  hook.port = 4567
  hook.on_push do |request|
    puuush(request)
  end
end

Rack::Handler::WEBrick.run(hooks.server, :Port => hooks.port)
