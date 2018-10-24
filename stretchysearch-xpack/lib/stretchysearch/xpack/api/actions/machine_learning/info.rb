module Stretchysearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # TODO: Description
          #
          #
          # @see [TODO]
          #
          def info(arguments={})
            method = Stretchysearch::API::HTTP_GET
            path   = "_xpack/ml/info"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
