module Stretchysearch
  module XPack
    module API
      module License
        module Actions

          # TODO: Description
          #
          # @option arguments [Boolean] :acknowledge whether the user has acknowledged acknowledge messages (default: false)
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/license-management.html
          #
          def post_start_basic(arguments={})
            valid_params = [
              :acknowledge ]
            method = Stretchysearch::API::HTTP_POST
            path   = "_xpack/license/start_basic"
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
