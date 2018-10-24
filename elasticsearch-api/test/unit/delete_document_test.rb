require 'test_helper'

module Stretchysearch
  module Test
    class DeleteTest < ::Test::Unit::TestCase

      context "Delete document" do
        subject { FakeClient.new }

        should "require the :index argument" do
          assert_raise ArgumentError do
            subject.delete :type => 'bar', :id => '1'
          end
        end

        should "require the :type argument" do
          assert_raise ArgumentError do
            subject.delete :index => 'foo', :id => '1'
          end
        end

        should "require the :id argument" do
          assert_raise ArgumentError do
            subject.delete :index => 'foo', :type => 'bar'
          end
        end

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'DELETE', method
            assert_equal 'foo/bar/1', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.delete :index => 'foo', :type => 'bar', :id => '1'
        end

        should "pass the URL parameters" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'foo/bar/1', url
            assert_equal 'abc123', params[:routing]
            true
          end.returns(FakeResponse.new)

          subject.delete :index => 'foo', :type => 'bar', :id => '1', :routing => 'abc123'
        end

        should "validate URL parameters" do
          assert_raise ArgumentError do
            subject.delete :index => 'foo', :type => 'bar', :id => '1', :qwertypoiuy => 'asdflkjhg'
          end
        end

        should "URL-escape the parts" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'foo%5Ebar/bar%2Fbam/1', url
            true
          end.returns(FakeResponse.new)

          subject.delete :index => 'foo^bar', :type => 'bar/bam', :id => 1
        end

        should "raise a NotFound exception" do
          subject.expects(:perform_request).raises(NotFound)

          assert_raise NotFound do
            subject.delete :index => 'foo', :type => 'bar', :id => 'XXX'
          end
        end

        should "catch a NotFound exception with the ignore parameter" do
          subject.expects(:perform_request).raises(NotFound)

          assert_nothing_raised do
            subject.delete :index => 'foo', :type => 'bar', :id => 'XXX', :ignore => 404
          end
        end

      end

    end
  end
end
