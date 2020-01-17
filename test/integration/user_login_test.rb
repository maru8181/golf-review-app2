require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  
  test 'invalid login' do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { email: '', password: '' }
    assert_template 'devise/sessions/new'
  end

  test 'valid login logout' do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { user: { email: 'hoge@example.co.jp', password: 'password' } }
    # assert logged_in?
    assert_redirected_to tweets_url
    follow_redirect!
    assert_template 'tweets/index'
    delete destroy_user_session_path
    # assert_not logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'tops/index'
  end
end
