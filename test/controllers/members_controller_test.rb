require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
  end

  test 'login user should get show' do
    login_as(@user)
    get member_path(@user)
    assert_response :success
  end

  test 'not login user should get show' do
    get member_path(@user)
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_template 'devise/sessions/new'
  end
end
