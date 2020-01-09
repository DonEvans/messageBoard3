require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup 
    @message = Message.new( content:"This some content!" )
  end

  test 'should be valid' do
    assert @message.valid?
  end

  test 'content should be present' do
    @message.content = '      '
    assert_not @message.valid?
  end

  test 'content should not be too long' do
    @message.content = 'a'*1001
    assert_not @message.valid?
  end

end
