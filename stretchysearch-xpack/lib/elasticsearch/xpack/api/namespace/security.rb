module Stretchysearch
  module XPack
    module API
      module Security
        module Actions; end

        class SecurityClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, Security::Actions
        end

        def security
          @security ||= SecurityClient.new(self)
        end

      end
    end
  end
end
