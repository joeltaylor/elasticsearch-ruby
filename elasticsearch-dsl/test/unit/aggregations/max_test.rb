require 'test_helper'

module Stretchysearch
  module Test
    module Aggregations
      class MaxTest < ::Stretchysearch::Test::UnitTestCase
        include Stretchysearch::DSL::Search::Aggregations

        context "Max agg" do
          subject { Max.new }

          should "be converted to a Hash" do
            assert_equal({ max: {} }, subject.to_hash)
          end

          should "take a Hash" do
            subject = Max.new foo: 'bar'
            assert_equal({ max: { foo: 'bar' } }, subject.to_hash)
          end
        end
      end
    end
  end
end
