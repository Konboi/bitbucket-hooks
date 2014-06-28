require 'rack'
require 'uri'

module Bitbucket
  module Hooks
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
          request = parse_param(payload)
          @event.on('push', request)
          [200, [], ['OK']]
        else
          [400, [], ['BAD REQUEST']]
        end
      end

      private

      def parse_param(param)
        param = URI.unescape(param)

        param.gsub("\\\"", "\"")
      end
    end
  end
end
