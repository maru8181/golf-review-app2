require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    login_as(@user)
  end

  # test 'edit invalid' do
    get edit_user_registration_path(@user)
  #   patch user_registration_path(@user), params: { user: { username: '', email: '', password: '', password_confirmation: '', current_password: 'password' } }
  #   assert_template 'users/registrations/edit'
  # end

  test 'edit valid' do
    get edit_user_registration_path(@user)
    # patch user_registration_path(@user), params: { user: { username: 'example0', email: 'hoge@example.co.jp', password: '', password_confirmation: '', current_password: 'password' } }
    # assert_redirected_to root_url
    # follow_redirect!
    # assert_template 'tops/index'
  end
end
