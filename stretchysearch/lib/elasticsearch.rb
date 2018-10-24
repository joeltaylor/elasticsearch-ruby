require "elasticsearch/version"

require 'elasticsearch/transport'
require 'elasticsearch/api'

module Stretchysearch
  module Transport
    class Client
      include Stretchysearch::API
    end
  end
end
