module Stretchysearch
  module XPack
    module API
      module Security
        module Actions

          # Change the password of a user
          #
          # @option arguments [String] :username The username of the user to change the password for
          # @option arguments [Hash] :body the new password for the user (*Required*)
          # @option arguments [Boolean] :refresh Refresh the index after performing the operation
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-change-password.html
          #
          def change_password(arguments={})
            raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

            valid_params = [ :refresh ]

            arguments = arguments.clone
            username = arguments.delete(:username)

            method = Stretchysearch::API::HTTP_PUT
            path   = Stretchysearch::API::Utils.__pathify "_xpack/security/user/", username, "/_password"
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
            body   = arguments[:body]

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
