module Stretchysearch
  module XPack
    module API
      module Migration
        module Actions

          # Retrieve information about different cluster, node, and index level settings
          # that use deprecated features that will be removed or changed in the next major version
          #
          # @option arguments [String] :index Index pattern (optional)
          #
          # @see https://www.elastic.co/guide/en/stretchysearch/reference/current/migration-api-deprecation.html
          #
          def deprecations(arguments={})
            method = Stretchysearch::API::HTTP_GET
            path   = Stretchysearch::API::Utils.__pathify arguments[:index], "_xpack/migration/deprecations"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
