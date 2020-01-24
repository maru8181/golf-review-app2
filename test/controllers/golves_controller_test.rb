require 'test_helper'

class GolvesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get golves_psth
    assert_response :success
  end

  # test "should get show" do
  #   get golves_show_url
  #   assert_response :success
  # end

end
