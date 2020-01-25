require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get not_login' do
    get not_login_tops_path
    assert_response :success
  end
end
