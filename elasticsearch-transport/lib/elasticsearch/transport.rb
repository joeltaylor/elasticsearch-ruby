require "uri"
require "time"
require "timeout"
require "multi_json"
require "faraday"

require "elasticsearch/transport/transport/serializer/multi_json"
require "elasticsearch/transport/transport/sniffer"
require "elasticsearch/transport/transport/response"
require "elasticsearch/transport/transport/errors"
require "elasticsearch/transport/transport/base"
require "elasticsearch/transport/transport/connections/selector"
require "elasticsearch/transport/transport/connections/connection"
require "elasticsearch/transport/transport/connections/collection"
require "elasticsearch/transport/transport/http/faraday"
require "elasticsearch/transport/client"

require "elasticsearch/transport/version"

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
