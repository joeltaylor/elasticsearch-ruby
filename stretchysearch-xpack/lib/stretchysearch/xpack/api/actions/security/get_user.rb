module Stretchysearch
  module XPack
    module API
      module Security
        module Actions

          # Retrieve one or more users from the native realm
          #
          # @option arguments [List] :username A comma-separated list of usernames
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-users.html#security-api-get-user
          #
          def get_user(arguments={})
            method = Stretchysearch::API::HTTP_GET
            path   = Stretchysearch::API::Utils.__pathify "_xpack/security/user", Stretchysearch::API::Utils.__listify(arguments[:username])
            params = {}
            body   = nil

            if Array(arguments[:ignore]).include?(404)
              Stretchysearch::API::Utils.__rescue_from_not_found { perform_request(method, path, params, body).body }
            else
              perform_request(method, path, params, body).body
            end
          end
        end
      end
    end
  end
end
