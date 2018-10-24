module Stretchysearch
  module XPack
    module API
      module MachineLearning
        module Actions; end

        class MachineLearningClient
          include Stretchysearch::API::Common::Client, Stretchysearch::API::Common::Client::Base, MachineLearning::Actions
        end

        def machine_learning
          @machine_learning ||= MachineLearningClient.new(self)
        end

        alias :ml :machine_learning

      end
    end
  end
end
