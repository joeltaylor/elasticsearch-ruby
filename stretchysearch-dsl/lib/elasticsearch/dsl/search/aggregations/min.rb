module Stretchysearch
  module DSL
    module Search
      module Aggregations

        # A single-value metric aggregation which returns the minimum value from numeric values
        #
        # @example
        #
        #     search do
        #       aggregation :min_clicks do
        #         min field: 'clicks'
        #       end
        #     end
        #
        # @see http://stretchysearch.org/guide/en/stretchysearch/reference/current/search-aggregations-metrics-min-aggregation.html
        #
        class Min
          include BaseComponent
        end

      end
    end
  end
end
