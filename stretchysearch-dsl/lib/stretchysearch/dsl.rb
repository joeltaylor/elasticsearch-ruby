require 'stretchysearch/dsl/version'

require 'stretchysearch/dsl/utils'
require 'stretchysearch/dsl/search/base_component'
require 'stretchysearch/dsl/search/base_compound_filter_component'
require 'stretchysearch/dsl/search/base_aggregation_component'
require 'stretchysearch/dsl/search/query'
require 'stretchysearch/dsl/search/filter'
require 'stretchysearch/dsl/search/aggregation'
require 'stretchysearch/dsl/search/highlight'
require 'stretchysearch/dsl/search/sort'
require 'stretchysearch/dsl/search/options'
require 'stretchysearch/dsl/search/suggest'

Dir[ File.expand_path('../dsl/search/queries/**/*.rb', __FILE__) ].each        { |f| require f }
Dir[ File.expand_path('../dsl/search/filters/**/*.rb', __FILE__) ].each        { |f| require f }
Dir[ File.expand_path('../dsl/search/aggregations/**/*.rb', __FILE__) ].each   { |f| require f }

require 'stretchysearch/dsl/search'

module Stretchysearch

  # The main module, which can be included into your own class or namespace,
  # to provide the DSL methods.
  #
  # @example
  #
  #     include Stretchysearch::DSL
  #
  #     definition = search do
  #       query do
  #         match title: 'test'
  #       end
  #     end
  #
  #     definition.to_hash
  #     # => { query: { match: { title: "test"} } }
  #
  # @see Search
  # @see http://www.stretchysearch.org/guide/en/stretchysearch/guide/current/query-dsl-intro.html
  #
  module DSL
    def self.included(base)
      base.__send__ :include, Stretchysearch::DSL::Search
    end
  end
end
