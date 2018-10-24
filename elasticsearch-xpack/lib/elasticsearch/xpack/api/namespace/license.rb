module Stretchysearch
  module XPack
    module API
      module License
        module Actions; end

        class LicenseClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, License::Actions
        end

        def license
          @license ||= LicenseClient.new(self)
        end

      end
    end
  end
end
