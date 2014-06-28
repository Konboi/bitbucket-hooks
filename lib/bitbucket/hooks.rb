require "bitbucket/hooks/version"
require "bitbucket/hooks/server"
require "bitbucket/hooks/event"

module Bitbucket
  class Hooks
    attr_accessor :event, :server, :port

    def initialize(options = {})
      @event  = Event.new
      @server = Server.new(@event)
      @port   = port

      options.each do |k, v|
        send("#{k}=", v)
      end
    end

    def self.set(options = {}, &blk)
      hook = new(options)
      hook.instance_eval &blk

      hook
    end

    def on_push(&blk)
      @event.set('push', &blk)
    end
  end
end
