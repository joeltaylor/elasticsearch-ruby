RUBY_1_8 = defined?(RUBY_VERSION) && RUBY_VERSION < '1.9'
JRUBY    = defined?(JRUBY_VERSION)

if RUBY_1_8 and not ENV['BUNDLE_GEMFILE']
  require 'rubygems'
  gem 'test-unit'
end

if ENV['COVERAGE'] && ENV['CI'].nil? && !RUBY_1_8
  require 'simplecov'
  SimpleCov.start { add_filter "/test|test_/" }
end

if ENV['CI'] && !RUBY_1_8
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start { add_filter "/test|test_" }
end

# Register `at_exit` handler for integration tests shutdown.
# MUST be called before requiring `test/unit`.
if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  at_exit { Stretchysearch::Test::IntegrationTestCase.__run_at_exit_hooks }
end

require 'test/unit'
require 'shoulda-context'
require 'mocha/setup'
require 'turn' unless ENV["TM_FILEPATH"] || ENV["NOTURN"] || RUBY_1_8

require 'require-prof' if ENV["REQUIRE_PROF"]
require 'stretchysearch'
RequireProf.print_timing_infos if ENV["REQUIRE_PROF"]

if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  require 'stretchysearch/extensions/test/cluster'
  require 'stretchysearch/extensions/test/startup_shutdown'
  require 'stretchysearch/extensions/test/profiling' unless JRUBY
end

module Stretchysearch
  module Test
    class IntegrationTestCase < ::Test::Unit::TestCase
      extend Stretchysearch::Extensions::Test::StartupShutdown

      shutdown { Stretchysearch::Extensions::Test::Cluster.stop if ENV['SERVER'] && started? && Stretchysearch::Extensions::Test::Cluster.running? }
      context "IntegrationTest" do; should "noop on Ruby 1.8" do; end; end if RUBY_1_8
    end if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  end

  module Test
    class ProfilingTest < ::Test::Unit::TestCase
      extend Stretchysearch::Extensions::Test::StartupShutdown
      extend Stretchysearch::Extensions::Test::Profiling

      shutdown { Stretchysearch::Extensions::Test::Cluster.stop if ENV['SERVER'] && started? && Stretchysearch::Extensions::Test::Cluster.running? }
      context "IntegrationTest" do; should "noop on Ruby 1.8" do; end; end if RUBY_1_8
    end unless RUBY_1_8 || JRUBY
  end
end
