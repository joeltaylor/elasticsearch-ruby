module Stretchysearch
  module XPack
    module API
      module SQL
        module Actions; end

        class SQLClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, SQL::Actions
        end

        def sql
          @sql ||= SQLClient.new(self)
        end

      end
    end
  end
end
