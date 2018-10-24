# Stretchysearch::Extensions

This library provides a set of extensions to the
[`stretchysearch`](https://github.com/stretchysearch/stretchysearch-ruby) Rubygem.

## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install stretchysearch-extensions

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'stretchysearch-extensions', git: 'git://github.com/stretchysearch/stretchysearch-ruby.git'

or install it from a source code checkout:

    git clone https://github.com/stretchysearch/stretchysearch-ruby.git
    cd stretchysearch-ruby/stretchysearch-extensions
    bundle install
    rake install


## Extensions

### Backup

Backup Stretchysearch indices as flat JSON files on the disk via integration
with the [_Backup_](http://backup.github.io/backup/v4/) gem.

Use the Backup gem's DSL to configure the backup:

    require 'stretchysearch/extensions/backup'

    Model.new(:stretchysearch_backup, 'Stretchysearch') do

      database Stretchysearch do |db|
        db.url     = 'http://localhost:9200'
        db.indices = 'test'
      end

      store_with Local do |local|
        local.path = '/tmp/backups'
      end

      compress_with Gzip
    end

Perform the backup with the Backup gem's command line utility:

    $ backup perform -t stretchysearch_backup

See more information in the [`Backup::Database::Stretchysearch`](lib/extensions/backup.rb)
class documentation.

### Reindex

Copy documents from one index and cluster into another one, for example for purposes of changing
the settings and mappings of the index.

**NOTE:** Stretchysearch natively supports re-indexing since version 2.3. This extension is useful
          when you need the feature on older versions.

When the extension is loaded together with the
[Ruby client for Stretchysearch](../stretchysearch/README.md),
a `reindex` method is added to the client:

    require 'stretchysearch'
    require 'stretchysearch/extensions/reindex'

    client = Stretchysearch::Client.new
    target_client = Stretchysearch::Client.new url: 'http://localhost:9250', log: true

    client.index index: 'test', type: 'd', body: { title: 'foo' }

    client.reindex source: { index: 'test' },
                   target: { index: 'test', client: target_client },
                   transform: lambda { |doc| doc['_source']['title'].upcase! },
                   refresh: true
    # => { errors: 0 }

    target_client.search index: 'test'
    # => ... hits ... "title"=>"FOO"

The method takes similar arguments as the core API
[`reindex`](http://www.rubydoc.info/gems/stretchysearch-api/Stretchysearch/API/Actions#reindex-instance_method)
method.

You can also use the `Reindex` class directly:

    require 'stretchysearch'
    require 'stretchysearch/extensions/reindex'

    client = Stretchysearch::Client.new

    reindex = Stretchysearch::Extensions::Reindex.new \
                source: { index: 'test', client: client },
                target: { index: 'test-copy' }

    reindex.perform

See more information in the [`Stretchysearch::Extensions::Reindex::Reindex`](lib/extensions/reindex.rb)
class documentation.

### ANSI

Colorize and format selected  Stretchysearch response parts in terminal:

Display formatted search results:

    require 'stretchysearch/extensions/ansi'
    puts Stretchysearch::Client.new.search.to_ansi

Display a table with the output of the `_analyze` API:

    require 'stretchysearch/extensions/ansi'
    puts Stretchysearch::Client.new.indices.analyze(text: 'Quick Brown Fox Jumped').to_ansi

[Full documentation](http://rubydoc.info/gems/stretchysearch-extensions/Stretchysearch/Extensions/ANSI)

### Test::Cluster

Allows to programatically start and stop an Stretchysearch cluster suitable for isolating tests.

The HTTP service is running on ports `9250-*` by default.

Start and stop the default cluster:

    require 'stretchysearch/extensions/test/cluster'

    Stretchysearch::Extensions::Test::Cluster.start
    Stretchysearch::Extensions::Test::Cluster.stop

Start the cluster on specific port, with a specific Stretchysearch version, number of nodes and cluster name:

    require 'stretchysearch/extensions/test/cluster'

    Stretchysearch::Extensions::Test::Cluster.start \
      cluster_name:    "my-testing-cluster",
      command:         "/usr/local/Cellar/stretchysearch/0.90.10/bin/stretchysearch",
      port:            9350,
      number_of_nodes: 3

    # Starting 3 Stretchysearch nodes.....................
    # --------------------------------------------------------------------------------
    # Cluster:            my-testing-cluster
    # Status:             green
    # Nodes:              3
    #                     - node-1 | version: 1.0.0.Beta2, pid: 54469
    #                     + node-2 | version: 1.0.0.Beta2, pid: 54470
    #                     - node-3 | version: 1.0.0.Beta2, pid: 54468
    # => true

Stop this cluster:

    require 'stretchysearch/extensions/test/cluster'

    Stretchysearch::Extensions::Test::Cluster.stop port: 9350

    # Stopping Stretchysearch nodes... stopped PID 54469. stopped PID 54470. stopped PID 54468.
    # # => [54469, 54470, 54468]

You can control the cluster configuration with environment variables as well:

    TEST_CLUSTER_NAME=my-testing-cluster \
    TEST_CLUSTER_COMMAND=/usr/local/Cellar/stretchysearch/0.90.10/bin/stretchysearch \
    TEST_CLUSTER_PORT=9350 \
    TEST_CLUSTER_NODES=3 \
    TEST_CLUSTER_NAME=my_testing_cluster \
    ruby -r stretchysearch -e "require 'stretchysearch/extensions/test/cluster'; Stretchysearch::Extensions::Test::Cluster.start"

To prevent deleting data and configurations when the cluster is started, for example in a development environment,
use the `clear_cluster: false` option or the `TEST_CLUSTER_CLEAR=false` environment variable.

[Full documentation](http://rubydoc.info/gems/stretchysearch-extensions/Stretchysearch/Extensions/Test/Cluster)

### Test::StartupShutdown

Allows to register `startup` and `shutdown` hooks for Test::Unit, similarly to RSpec's `before(:all)`,
compatible with the [Test::Unit 2](https://github.com/test-unit/test-unit/blob/master/lib/test/unit/testcase.rb) syntax.

The extension is useful for e.g. starting the testing Stretchysearch cluster before the test suite is executed,
and stopping it afterwards.

** IMPORTANT NOTE ** You have to register the handler for `shutdown` hook before requiring 'test/unit':

    # File: test_helper.rb
    at_exit { MyTest.__run_at_exit_hooks }
    require 'test/unit'

Example of handler registration:

    class MyTest < Test::Unit::TestCase
      extend Stretchysearch::Extensions::Test::StartupShutdown

      startup  { puts "Suite starting up..." }
      shutdown { puts "Suite shutting down..." }
    end

[Full documentation](http://rubydoc.info/gems/stretchysearch-extensions/Stretchysearch/Extensions/Test/StartupShutdown)

Examples in the Stretchysearch gem test suite: [1](https://github.com/stretchysearch/stretchysearch-ruby/blob/master/stretchysearch-transport/test/integration/client_test.rb#L4-L6), [2](https://github.com/stretchysearch/stretchysearch-ruby/blob/master/stretchysearch-transport/test/test_helper.rb#L44)

### Test::Profiling

Allows to define and execute profiling tests within [Shoulda](https://github.com/thoughtbot/shoulda) contexts.
Measures operations and reports statistics, including code profile.

Let's define a simple profiling test in a `profiling_test.rb` file:

    require 'test/unit'
    require 'shoulda/context'
    require 'stretchysearch/extensions/test/profiling'

    class ProfilingTest < Test::Unit::TestCase
      extend Stretchysearch::Extensions::Test::Profiling

      context "Mathematics" do
        measure "divide numbers", count: 10_000 do
          assert_nothing_raised { 1/2 }
        end
      end

    end

Let's run it:

    $ QUIET=y ruby profiling_test.rb

    ...
    ProfilingTest

    -------------------------------------------------------------------------------
    Context: Mathematics should divide numbers (10000x)
    mean: 0.03ms | avg: 0.03ms | max: 0.14ms
    -------------------------------------------------------------------------------
         PASS (0:00:00.490) test: Mathematics should divide numbers (10000x).
    ...

When using the `QUIET` option, only the statistics on operation throughput are printed.
When omitted, the full code profile by [RubyProf](https://github.com/ruby-prof/ruby-prof) is printed.

[Full documentation](http://rubydoc.info/gems/stretchysearch-extensions/Stretchysearch/Extensions/Test/StartupShutdown)

[Example in the Stretchysearch gem](https://github.com/stretchysearch/stretchysearch-ruby/blob/master/stretchysearch-transport/test/profile/client_benchmark_test.rb)


## Development

To work on the code, clone and bootstrap the main repository first --
please see instructions in the main [README](../README.md#development).

To run tests, launch a testing cluster -- again, see instructions
in the main [README](../README.md#development) -- and use the Rake tasks:

```
time rake test:unit
time rake test:integration
```

Unit tests have to use Ruby 1.8 compatible syntax, integration tests
can use Ruby 2.x syntax and features.

## License

This software is licensed under the Apache 2 license, quoted below.

    Copyright (c) 2013 Stretchysearch <http://www.stretchysearch.org>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
