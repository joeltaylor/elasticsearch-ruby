# encoding: UTF-8

require 'test_helper'

module Stretchysearch
  module Test
    class APITest < ::Test::Unit::TestCase

      context "The API module" do

        should "access the settings" do
          assert_not_nil Stretchysearch::API.settings
        end

        should "allow to set settings" do
          assert_nothing_raised { Stretchysearch::API.settings[:foo] = 'bar' }
          assert_equal 'bar', Stretchysearch::API.settings[:foo]
        end

        should "have default serializer" do
          assert_equal MultiJson, Stretchysearch::API.serializer
        end

      end

    end
  end
end
