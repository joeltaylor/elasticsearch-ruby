module Stretchysearch
  module XPack
    module API
      module Migration
        module Actions; end

        class MigrationClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, Migration::Actions
        end

        def migration
          @migration ||= MigrationClient.new(self)
        end

      end
    end
  end
end
