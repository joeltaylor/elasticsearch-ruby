require 'test_helper'

module Stretchysearch
  module Test
    class UtilsTest < ::Stretchysearch::Test::UnitTestCase
      context "Utils" do
        should "convert a string to camelcase" do
          assert_equal 'Foo', Stretchysearch::DSL::Utils.__camelize('foo')
        end

        should "convert an underscored string to camelcase" do
          assert_equal 'FooBar', Stretchysearch::DSL::Utils.__camelize('foo_bar')
        end

        should "convert a symbol" do
          assert_equal 'FooBar', Stretchysearch::DSL::Utils.__camelize(:foo_bar)
        end
      end
    end
  end
end
