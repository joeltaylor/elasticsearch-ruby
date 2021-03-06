module Stretchysearch
  module XPack
    module API
      module Security
        module Actions

          # Update or create a user for the native realm
          #
          # @option arguments [String] :username The username of the User (*Required*)
          # @option arguments [Hash] :body The user to add (*Required*)
          # @option arguments [Boolean] :refresh Refresh the index after performing the operation
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-users.html#security-api-put-user
          #
          def put_user(arguments={})
            raise ArgumentError, "Required argument 'username' missing" unless arguments[:username]
            raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

            valid_params = [ :refresh ]

            arguments = arguments.clone
            username = arguments.delete(:username)

            method = Stretchysearch::API::HTTP_PUT
            path   = Stretchysearch::API::Utils.__pathify "_xpack/security/user", username
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
            body   = arguments[:body]

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
