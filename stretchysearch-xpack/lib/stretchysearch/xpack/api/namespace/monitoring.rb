module Stretchysearch
  module XPack
    module API
      module Monitoring
        module Actions; end

        class MonitoringClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, Monitoring::Actions
        end

        def monitoring
          @monitoring ||= MonitoringClient.new(self)
        end

      end
    end
  end
end
