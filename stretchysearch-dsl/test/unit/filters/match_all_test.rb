require 'test_helper'

module Stretchysearch
  module Test
    module Filters
      class MatchAllTest < ::Stretchysearch::Test::UnitTestCase
        include Stretchysearch::DSL::Search::Filters

        context "MatchAll filter" do
          subject { MatchAll.new }

          should "be converted to a Hash" do
            assert_equal({ match_all: {} }, subject.to_hash)
          end

        end
      end
    end
  end
end
