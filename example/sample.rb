require 'bitbucket/hooks'

event = Bitbucket::Hooks::Event.new
server = Bitbucket::Hooks::Server.new(event)

Rack::Handler::WEBrick.run(server)
