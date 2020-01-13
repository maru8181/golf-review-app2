require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  def setup
    @tweet = tweets(:tweet1)
  end

  test 'should be valid' do
    assert @tweet.valid?
  end

  test 'golf_id should be presence' do
    @tweet.golf_id = ''
    assert_not @tweet.valid?
  end

  test 'point_id should be presence' do
    @tweet.point_id = ''
    assert_not @tweet.valid?
  end

  test 'text should not be too long' do
    @tweet.text = 'a' * 10_001
    assert_not @tweet.valid?
  end
end
