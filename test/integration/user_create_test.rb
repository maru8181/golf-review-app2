require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest
  test 'invalid create' do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: { username: '', email: '', password: '', password_confirmation: '' } }
    end
    assert_template 'devise/registrations/new'
  end

  # test 'valid create' do
  #   get new_user_registration_path
  #   assert_difference 'User.count', 1 do
  #     post user_registration_path, params: { user: { username: 'example3', email: 'hoge3@example.co.jp', password: 'password', password_confirmation: 'password' } }
  #   end
  #   assert_redirected_to root_url
  #   follow_redirect!
  #   assert_template 'tweets/index'
  # end
end
