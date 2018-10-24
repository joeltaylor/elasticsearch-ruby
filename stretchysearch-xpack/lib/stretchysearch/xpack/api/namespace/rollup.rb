module Stretchysearch
  module XPack
    module API
      module Rollup
        module Actions; end

        class RollupClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, Rollup::Actions
        end

        def rollup
          @rollup ||= RollupClient.new(self)
        end

      end
    end
  end
end
