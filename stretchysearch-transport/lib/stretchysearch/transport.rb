require "uri"
require "time"
require "timeout"
require "multi_json"
require "faraday"

require "stretchysearch/transport/transport/serializer/multi_json"
require "stretchysearch/transport/transport/sniffer"
require "stretchysearch/transport/transport/response"
require "stretchysearch/transport/transport/errors"
require "stretchysearch/transport/transport/base"
require "stretchysearch/transport/transport/connections/selector"
require "stretchysearch/transport/transport/connections/connection"
require "stretchysearch/transport/transport/connections/collection"
require "stretchysearch/transport/transport/http/faraday"
require "stretchysearch/transport/client"

require "stretchysearch/transport/version"

module Stretchysearch
  module Client

    # A convenience wrapper for {::Stretchysearch::Transport::Client#initialize}.
    #
    def new(arguments={}, &block)
      Stretchysearch::Transport::Client.new(arguments, &block)
    end
    extend self
  end
end
