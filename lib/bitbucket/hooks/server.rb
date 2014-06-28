require 'rack'
require 'uri'

module Bitbucket
  class Hooks
    class Server
      attr_reader :event

      def initialize(event)
        @event = event
      end

      def call(env)
        req = Rack::Request.new(env)
        begin
          payload = req.params["payload"]
        rescue => e
          [400, [], ['BAD REQUEST']]
        end

        if req.request_method == 'POST' and payload
          @event.on('push', payload)
          [200, [], ['OK']]
        else
          [400, [], ['BAD REQUEST']]
        end
      end
    end
  end
end
