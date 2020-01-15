require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:user1)
  end

  # test 'invalid create' do
  #   get new_user_registration_path
  #   assert_no_difference 'User.count' do
  #     post user_registration_path, params: { user: { username: '', email: '', password: '',password_confirmation: '' } }
  #   end
  #   assert_redirected_to new_user_registration_url
  #   follow_redirect!
  #   assert_template 'devise/registrations/new'
  # end

  # test 'valid create' do
  #   get new_user_registration_path
  #   assert_difference 'User.count', 1 do
  #     post user_registration_path, params: { user: { username: 'example3', email: 'example3', encrypted_password: 'password', password_confirmation: 'password' } }
  #   end
  #   assert_redirected_to member_url(user)
  #   follow_redirect!
  #   assert_template 'member/show'
  # end

end
