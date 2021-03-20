require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
 
  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { textColor: "",
                                              font: "" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    textColor = "yellow"
    font = "Ubuntu"
    patch user_path(@user), params: { user: { textColor: textColor,
                                              font: font } }
    #assert_not flash.empty?
    #assert_redirected_to @user
    @user.reload
    assert_equal textColor, @user.textColor
    assert_equal font, @user.font
  end
end
