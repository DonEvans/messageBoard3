require "test_helper"

class TopicTest < ActiveSupport::TestCase
  
  def setup
      @user = users(:michael)
      @topic = Topic.new( title:'One', user_id: @user.id )
  end

  test 'should be valid' do
    assert @topic.valid?
  end

  test 'title should be present' do
    @topic.title = '     '
    assert_not @topic.valid?
  end

  test 'title should not be too long' do
    @topic.title = 'A'*31
  end

  test 'user_id should be present' do
    @topic.user_id =  nil
    assert_not @topic.valid?
  end

end
