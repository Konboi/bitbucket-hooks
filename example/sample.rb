require 'bitbucket/hooks'
require 'pp'

def puuush(req)
  pp req.class
  pp req
end

hooks = Bitbucket::Hooks.set do |hook|
  hook.port = 4567
  hook.on_push do |request|
    puuush(request)
  end
end

Rack::Handler::WEBrick.run(hooks.server, :Port => hooks.port)
