require 'test_helper'

module Stretchysearch
  module Test
    module Aggregations
      class GlobalTest < ::Stretchysearch::Test::UnitTestCase
        include Stretchysearch::DSL::Search::Aggregations

        context "Global agg" do
          subject { Global.new }

          should "be converted to a Hash" do
            assert_equal({ global: {} }, subject.to_hash)
          end

          should "take a block" do
            subject = Global.new do
            end
            assert_equal({global: {} }, subject.to_hash)
          end

          should "define aggregations" do
            subject = Global.new do
              aggregation :foo do
                terms field: "bar"
              end
            end
            expected = {
              aggregations: { foo: { terms: { field: "bar" } } },
              global: {}
            }
            assert_equal(expected, subject.to_hash)
          end
        end
      end
    end
  end
end
