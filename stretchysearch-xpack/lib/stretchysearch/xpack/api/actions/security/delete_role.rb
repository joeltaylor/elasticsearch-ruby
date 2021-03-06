module Stretchysearch
  module XPack
    module API
      module Security
        module Actions

          # Remove a role from the native realm
          #
          # @option arguments [String] :name Role name (*Required*)
          # @option arguments [Boolean] :refresh Refresh the index after performing the operation
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-roles.html#security-api-delete-role
          #
          def delete_role(arguments={})
            raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

            valid_params = [ :refresh ]

            method = Stretchysearch::API::HTTP_DELETE
            path   = "_xpack/security/role/#{arguments[:name]}"
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
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
