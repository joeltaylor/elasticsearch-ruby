module Stretchysearch
  module DSL
    module Search
      module Filters

        # A filter which returns documents where the field value a specified prefix
        #
        # @example
        #
        #     search do
        #       query do
        #         filtered do
        #           filter do
        #             prefix path: '/usr/local'
        #           end
        #         end
        #       end
        #     end
        #
        # @see http://stretchysearch.org/guide/en/stretchysearch/reference/current/query-dsl-prefix-filter.html
        #
        class Prefix
          include BaseComponent
        end

      end
    end
  end
end
