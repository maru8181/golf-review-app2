require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet = tweets(:tweet1)
    @user = users(:user1)
    login_as(@user)
  end

  test 'should get index' do
    get tweets_path
    assert_response :success
  end

  test 'should get new' do
    get new_tweet_path
    assert_response :success
  end

  test 'should create tweet' do
    assert_difference('Tweet.count') do
      post tweets_url, params: { tweet: { golf_id: @tweet.golf_id, point_id: @tweet.point_id, text: @tweet.text } }
    end
    assert_redirected_to tweet_url(Tweet.last)
  end

  test 'should show tweet' do
    get tweet_path(@tweet)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tweet_path(@tweet)
    assert_response :success
  end

  test 'should update tweet' do
    patch tweet_path(@tweet), params: { tweet: { golf_id: @tweet.golf_id, point_id: @tweet.point_id, text: @tweet.text } }
    assert_redirected_to tweet_url(@tweet)
  end

  test 'should destroy tweet' do
    assert_difference('Tweet.count', -1) do
      delete tweet_path(@tweet)
    end
    assert_redirected_to tweets_url
  end
end
