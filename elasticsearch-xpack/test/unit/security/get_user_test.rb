require 'test_helper'

module Stretchysearch
  module Test
    class XPackSecurityGetUserTest < Minitest::Test

      context "XPack Security: Get user" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_xpack/security/user', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.get_user
        end

        should "perform correct request for multiple roles" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_xpack/security/user/foo,bar', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.get_user username: ['foo', 'bar']
        end

        should "catch a NotFound exception with the ignore parameter" do
          subject.expects(:perform_request).raises(NotFound)

          assert_nothing_raised do
            subject.xpack.security.get_user username: 'foo', ignore: 404
          end
        end
      end
    end
  end
end
