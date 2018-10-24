require "stretchysearch/version"

require 'stretchysearch/transport'
require 'stretchysearch/api'

module Stretchysearch
  module Transport
    class Client
      include Stretchysearch::API
    end
  end
end
