# encoding: utf-8

require 'stretchysearch/extensions'

require 'ansi'
require 'ansi/table'
require 'ansi/terminal'

require 'delegate'
require 'stretchysearch/transport/transport/response'

require 'stretchysearch/extensions/ansi/helpers'
require 'stretchysearch/extensions/ansi/actions'
require 'stretchysearch/extensions/ansi/response'

module Stretchysearch
  module Extensions

    # This extension provides a {ResponseBody#to_ansi} method for the Stretchysearch response body,
    # which colorizes and formats the output with the `ansi` gem.
    #
    # @example Display formatted search results
    #
    #     require 'stretchysearch/extensions/ansi'
    #     puts Stretchysearch::Client.new.search.to_ansi
    #
    # @example Display a table with the output of the `_analyze` API
    #
    #     require 'stretchysearch/extensions/ansi'
    #     puts Stretchysearch::Client.new.indices.analyze(text: 'Quick Brown Fox Jumped').to_ansi
    #
    module ANSI
    end

  end
end
