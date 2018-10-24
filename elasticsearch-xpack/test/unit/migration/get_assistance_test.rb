require 'test_helper'

module Stretchysearch
  module Test
    class XPackMigrationGetAssistanceTest < Minitest::Test

      context "XPack Migration: Get assistance" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_xpack/migration/assistance', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.migration.get_assistance
        end

      end

    end
  end
end
