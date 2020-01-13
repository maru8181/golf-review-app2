require 'test_helper'

class TweetsEditTest < ActionDispatch::IntegrationTest
  def setup
    @tweet = tweets(:tweet1)
  end

  test 'edit invalid' do
    get edit_tweet_path(@tweet)
    patch tweet_path(@tweet), params: { tweet: { golf_id: nil, point_id: nil, text: 'a' * 10_001 } }
    assert_template :edit
  end

  test 'edit valid' do
    get edit_tweet_path(@tweet)
    patch tweet_path(@tweet), params: { tweet: { golf_id: @tweet.golf_id, point_id: @tweet.point_id, text: @tweet.text } }
    assert_redirected_to tweet_url(@tweet)
    follow_redirect!
    assert_template 'tweets/show'
  end
end
