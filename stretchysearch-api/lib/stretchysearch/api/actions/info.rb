module Stretchysearch
  module API
    module Actions

      # Return simple information about the cluster (name, version).
      #
      # @see http://stretchysearch.org/guide/
      #
      def info(arguments={})
        method = HTTP_GET
        path   = ""
        params = {}
        body   = nil

        perform_request(method, path, params, body).body
      end
    end
  end
end
