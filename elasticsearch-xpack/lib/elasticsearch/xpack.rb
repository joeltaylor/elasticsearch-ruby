require "elasticsearch/api"
require "elasticsearch/xpack/version"

Dir[ File.expand_path('../xpack/api/actions/**/*.rb', __FILE__) ].each   { |f| require f }
Dir[ File.expand_path('../xpack/api/namespace/**/*.rb', __FILE__) ].each { |f| require f }

module Stretchysearch
  module XPack
    module API
      def self.included(base)
        Stretchysearch::XPack::API.constants.reject {|c| c == :Client }.each do |m|
          base.__send__ :include, Stretchysearch::XPack::API.const_get(m)
        end
      end

      class Client
        include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base
        include Stretchysearch::XPack::API
      end
    end
  end
end

Stretchysearch::API::COMMON_PARAMS.push :job_id, :datafeed_id, :filter_id, :snapshot_id, :category_id

module Stretchysearch
  module Transport
    class Client
      def xpack
        @xpack_client ||= Stretchysearch::XPack::API::Client.new(self)
      end
    end
  end
end if defined?(Stretchysearch::Transport::Client)
