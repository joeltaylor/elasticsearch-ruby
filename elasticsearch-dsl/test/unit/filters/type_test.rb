require 'test_helper'

module Stretchysearch
  module Test
    module Filters
      class TypeTest < ::Stretchysearch::Test::UnitTestCase
        include Stretchysearch::DSL::Search::Filters

        context "Type filter" do
          subject { Type.new }

          should "be converted to a Hash" do
            assert_equal({ type: {} }, subject.to_hash)
          end

          should "have option methods" do
            subject = Type.new :foo

            subject.value 'bar'

            assert_equal %w[ value ],
                         subject.to_hash[:type][:foo].keys.map(&:to_s).sort
            assert_equal 'bar', subject.to_hash[:type][:foo][:value]
          end

          should "take a block" do
            subject = Type.new :foo do
              value 'bar'
            end
            assert_equal({type: { foo: { value: 'bar' } }}, subject.to_hash)
          end
        end
      end
    end
  end
end
