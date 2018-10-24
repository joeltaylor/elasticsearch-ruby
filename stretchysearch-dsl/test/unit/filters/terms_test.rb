require 'test_helper'

module Stretchysearch
  module Test
    module Filters
      class TermsTest < ::Stretchysearch::Test::UnitTestCase
        include Stretchysearch::DSL::Search::Filters

        context "Terms filter" do
          subject { Terms.new }

          should "be converted to a Hash" do
            assert_equal({ terms: {} }, subject.to_hash)
          end

          should "be take a Hash" do
            subject = Terms.new foo: ['abc', 'xyz']
            assert_equal({ terms: { foo: ['abc', 'xyz'] } }, subject.to_hash)
          end
        end
      end
    end
  end
end
