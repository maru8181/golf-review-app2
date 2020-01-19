require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
    @user2 = users(:user2)
    @tweet = tweets(:tweet1)
  end

  test 'cureent_user should get show' do
    login_as(@user)
    get member_path(@user)
    assert_template 'members/show'
    assert_select 'a[href=?]', destroy_user_session_path, count: 1
    assert_select 'a[href=?]', edit_user_registration_path, count: 1
    assert_select 'a[href=?]', member_path(@user), count: 1
    # assert_select 'a[href=?]', edit_tweet_path(@tweet), count: 1
    # assert_select 'a[href=?]', tweet_path(@tweet), count: 2
  end

  test 'not current_user should get show' do
    login_as(@user2)
    get member_path(@user)
    assert_template 'members/show'
    assert_select 'a[href=?]', destroy_user_session_path, count: 1
    assert_select 'a[href=?]', edit_user_registration_path, count: 1
    assert_select 'a[href=?]', member_path(@user2), count: 1
  end
end
