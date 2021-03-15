require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup 
    @message = Message.new( content: "This some content!", user_id: 1,topic_id: 1 )
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

  test 'user_id should be present' do
    @message.user_id = nil
    assert_not @message.valid?
  end

  test 'topic_id should be present' do
    @message.topic_id = nil
    assert_not @message.valid?
  end

end
