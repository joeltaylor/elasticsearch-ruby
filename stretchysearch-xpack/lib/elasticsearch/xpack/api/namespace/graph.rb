module Stretchysearch
  module XPack
    module API
      module Graph
        module Actions; end

        class GraphClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, Graph::Actions
        end

        def graph
          @graph ||= GraphClient.new(self)
        end

      end
    end
  end
end
