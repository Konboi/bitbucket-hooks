require "bitbucket/hooks/version"
require "bitbucket/hooks/server"
require "bitbucket/hooks/event"

module Bitbucket
  module Hooks
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

    def on_pull_request(&blk)
      @event.set('pull_request', &blk)
    end

    def on_commit_comment(&blk)
      @event.set('commit_comment', &blk)
    end

    def on_issues(&blk)
      @event.set('issues', &blk)
    end

    def on_issue_comment(&blk)
      @event.set('issue_comment', &blk)
    end
  end
end
