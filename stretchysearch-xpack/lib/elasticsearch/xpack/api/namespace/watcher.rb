module Stretchysearch
  module XPack
    module API
      module Watcher
        module Actions; end

        class WatcherClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, Watcher::Actions
        end

        def watcher
          @watcher ||= WatcherClient.new(self)
        end

      end
    end
  end
end
