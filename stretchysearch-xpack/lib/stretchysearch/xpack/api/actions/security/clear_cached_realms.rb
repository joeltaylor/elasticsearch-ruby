module Stretchysearch
  module XPack
    module API
      module Security
        module Actions

          # Clears the internal user caches for specified realms
          #
          # @option arguments [String] :realms Comma-separated list of realms to clear (*Required*)
          # @option arguments [String] :usernames Comma-separated list of usernames to clear from the cache
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-clear-cache.html
          #
          def clear_cached_realms(arguments={})
            raise ArgumentError, "Required argument 'realms' missing" unless arguments[:realms]

            valid_params = [ :usernames ]

            arguments = arguments.clone
            realms = arguments.delete(:realms)

            method = Stretchysearch::API::HTTP_POST
            path   = Stretchysearch::API::Utils.__pathify "_xpack/security/realm/", Stretchysearch::API::Utils.__listify(realms), "_clear_cache"
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
