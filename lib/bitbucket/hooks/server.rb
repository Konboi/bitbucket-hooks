require 'rack'

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
          info "#{e} - #{e.backtrace}"
          [400, [], ['BAD REQUEST']]
        end
        if req.request_method == 'POST' and payload
          @event.on('push', req)
          [200, [], ['OK']]
        else
          [400, [], ['BAD REQUEST']]
        end
      end

      private

      def info(msg)
        puts "#{Time.now.strftime('%H:%M:%S')} #{msg}"
      end
    end
  end
end
