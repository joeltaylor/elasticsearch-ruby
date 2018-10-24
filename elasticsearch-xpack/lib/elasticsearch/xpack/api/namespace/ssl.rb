module Stretchysearch
  module XPack
    module API
      module SSL
        module Actions; end

        class SSLClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, SSL::Actions
        end

        def ssl
          @ssl ||= SSLClient.new(self)
        end

      end
    end
  end
end
