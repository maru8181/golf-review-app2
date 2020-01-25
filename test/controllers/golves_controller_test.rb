require 'test_helper'

class GolvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @golf = golves(:golf1)
    @user = users(:user1)
    login_as(@user)
  end

  test 'should get index' do
    get golves_path
    assert_response :success
  end

  test 'should get show' do
    get golf_path(@golf)
    assert_response :success
  end

  test 'should get rank' do
    get rank_golves_path
    assert_response :success
  end
end
