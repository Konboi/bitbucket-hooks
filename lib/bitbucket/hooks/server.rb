require ''

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

          if event_name && @event.events[:"#{event_name}"]
            @event.on(event_name, req)
          end

          [200, [], ['OK']]
        else
          [400, [], ['BAD REQUEST']]
        end
      end
    end
  end
end
