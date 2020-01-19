require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:user1).id, followed_id: users(:user2).id)
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test 'should require a follower_id' do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test 'should require a followed_id' do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

  test 'should follow and unfollow a user' do
    user1 = users(:user1)
    user2 = users(:user2)
    assert_not user1.following?(user2)
    user1.follow(user2)
    assert user1.following?(user2)
    assert user2.followers.include?(user1)
    user1.unfollow(user2)
    assert_not user1.following?(user2)
  end
end
