class Tweet < ApplicationRecord
  belongs_to :golf
  belongs_to :point
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :golf_id, presence: true
  validates :point_id, presence: true
  validates :text, length: { minimum: 0, maximum: 1000 }

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
