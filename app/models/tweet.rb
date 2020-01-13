class Tweet < ApplicationRecord
  belongs_to :golf
  belongs_to :point
  validates :golf_id, presence: true
  validates :point_id, presence: true
  validates :text, length: { minimum: 0, maximum: 10_000 }
end
