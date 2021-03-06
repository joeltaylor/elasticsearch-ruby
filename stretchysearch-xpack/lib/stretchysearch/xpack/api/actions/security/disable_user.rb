module Stretchysearch
  module XPack
    module API
      module Security
        module Actions

          # Disable a user
          #
          # @option arguments [String] :username The username of the user to disable
          # @option arguments [String] :refresh If `true` (the default) then refresh the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` then do nothing with refreshes. (options: true, false, wait_for)
          #
          # @see https://www.elastic.co/guide/en/x-pack/5.4/security-api-users.html
          #
          def disable_user(arguments={})
            valid_params = [
              :username,
              :refresh ]

            arguments = arguments.clone
            username = arguments.delete(:username)

            method = Stretchysearch::API::HTTP_PUT
            path   = "_xpack/security/user/#{username}/_disable"
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
