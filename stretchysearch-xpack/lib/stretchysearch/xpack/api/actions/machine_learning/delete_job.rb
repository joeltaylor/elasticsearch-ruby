module Stretchysearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # Delete an existing anomaly detection job
          #
          # @option arguments [String] :job_id The ID of the job to delete (*Required*)
          # @option arguments [Boolean] :force True if the job should be forcefully deleted
          #
          # @see http://www.elastic.co/guide/en/stretchysearch/reference/current/ml-delete-job.html
          #
          def delete_job(arguments={})
            raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]
            valid_params = [
              :force ]
            method = Stretchysearch::API::HTTP_DELETE
            path   = "_xpack/ml/anomaly_detectors/#{arguments[:job_id]}"
            params = Stretchysearch::API::Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
