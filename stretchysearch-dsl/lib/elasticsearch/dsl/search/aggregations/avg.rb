module Stretchysearch
  module DSL
    module Search
      module Aggregations

        # A single-value metric aggregation which returns the average of numeric values
        #
        # @example
        #
        #     search do
        #       aggregation :avg_clicks do
        #         avg field: 'clicks'
        #       end
        #     end
        #
        # @see http://stretchysearch.org/guide/en/stretchysearch/reference/current/search-aggregations-metrics-avg-aggregation.html
        #
        class Avg
          include BaseComponent
        end

      end
    end
  end
end
