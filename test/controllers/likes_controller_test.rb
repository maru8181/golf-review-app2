require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet = tweets(:tweet2)
    @user = users(:user1)
    login_as(@user)
  end

  # test 'valid like' do
  #   get tweets_path
  #   post tweet_likes_path(@tweet)
  # end

  # test 'valid unlike' do
  # end
end
