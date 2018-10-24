require 'test_helper'

module Stretchysearch
  module Test
    class SearchSuggestTest < ::Stretchysearch::Test::UnitTestCase
      subject { Stretchysearch::DSL::Search::Suggest.new :foo }

      context "Search suggest" do
        should "be an empty hash by default" do
          assert_equal({ foo: {} }, subject.to_hash)
        end

        should "contain options" do
          subject = Stretchysearch::DSL::Search::Suggest.new :foo, boo: 'bam'
          assert_equal({ foo: { boo: 'bam' } }, subject.to_hash)
        end
      end
    end
  end
end
