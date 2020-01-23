require 'test_helper'

class TweetsCreateTest < ActionDispatch::IntegrationTest
  setup do
    @tweet = tweets(:tweet1)
    @user = users(:user1)
    login_as(@user)
  end

  test 'create invalid' do
    get new_tweet_path
    assert_no_difference 'Tweet.count' do
      post tweets_path, params: { tweet: { golf_id: nil, point_id: nil, text: 'a' * 10_001, image: '' } }
    end
    assert_template :new
  end

  test 'create valid' do
    get new_tweet_path
    assert_difference 'Tweet.count', 1 do
      post tweets_url, params: { tweet: { golf_id: @tweet.golf_id, point_id: @tweet.point_id, text: @tweet.text, image: @tweet.image } }
    end
    assert_redirected_to tweet_url(Tweet.last)
    follow_redirect!
    assert_template 'tweets/show'
  end
end
