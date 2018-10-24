require 'test_helper'

class Stretchysearch::Transport::Transport::SerializerTest < Test::Unit::TestCase

  context "Serializer" do

    should "use MultiJson by default" do
      ::MultiJson.expects(:load)
      ::MultiJson.expects(:dump)
      Stretchysearch::Transport::Transport::Serializer::MultiJson.new.load('{}')
      Stretchysearch::Transport::Transport::Serializer::MultiJson.new.dump({})
    end

  end

end
