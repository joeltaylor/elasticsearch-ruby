require 'test_helper'

module Stretchysearch
  module Test
    module Aggregations
      class MinTest < ::Stretchysearch::Test::UnitTestCase
        include Stretchysearch::DSL::Search::Aggregations

        context "Min agg" do
          subject { Min.new }

          should "be converted to a Hash" do
            assert_equal({ min: {} }, subject.to_hash)
          end

          should "take a Hash" do
            subject = Min.new foo: 'bar'
            assert_equal({ min: { foo: 'bar' } }, subject.to_hash)
          end
        end
      end
    end
  end
end
