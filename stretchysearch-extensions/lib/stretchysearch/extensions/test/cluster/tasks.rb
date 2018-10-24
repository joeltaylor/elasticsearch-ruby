require 'stretchysearch/extensions/test/cluster'

namespace :stretchysearch do
  desc "Start Stretchysearch cluster for tests"
  task :start do
    Stretchysearch::Extensions::Test::Cluster.start
  end

  desc "Stop Stretchysearch cluster for tests"
  task :stop do
    Stretchysearch::Extensions::Test::Cluster.stop
  end
end
