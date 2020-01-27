require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
    @user2 = users(:user2)
    @tweet = tweets(:tweet1)
    @admin_user = users(:user5)
    @guest_user = users(:user6)
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
    assert_select 'a[href=?]', member_path(@user2), count: 1
  end

  test 'admin_user delete user' do
    login_as(@admin_user)
    get members_path
    assert_template 'members/index'
    assert_difference('User.count', -1) do
      delete member_path(@user)
    end
    assert_redirected_to members_url
    follow_redirect!
    assert_template 'members/index'
    assert_not flash.empty?
  end

  test 'admin_user not delete admin_user' do
    login_as(@admin_user)
    get members_path
    assert_template 'members/index'
    assert_no_difference('User.count') do
      delete member_path(@admin_user)
    end
    assert_redirected_to members_url
    follow_redirect!
    assert_template 'members/index'
    assert_not flash.empty?
  end

  test 'admin_user not delete guest_user' do
    login_as(@admin_user)
    get members_path
    assert_template 'members/index'
    assert_no_difference('User.count') do
      delete member_path(@guest_user)
    end
    assert_redirected_to members_url
    follow_redirect!
    assert_template 'members/index'
    assert_not flash.empty?
  end

  test 'not admin_user member/index not access' do
    login_as(@user)
    get members_path
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'tops/index'
  end
end
