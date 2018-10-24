require 'test_helper'

module Stretchysearch
  module Test
    class DSLTest < ::Stretchysearch::Test::UnitTestCase
      context "The DSL" do
        class DummyDSLReceiver
          include Stretchysearch::DSL
        end

        should "include the module in receiver" do
          assert_contains DummyDSLReceiver.included_modules, Stretchysearch::DSL
          assert_contains DummyDSLReceiver.included_modules, Stretchysearch::DSL::Search
        end
      end
    end
  end
end
