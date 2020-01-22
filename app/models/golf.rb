class Golf < ApplicationRecord
  has_many :tweets
  ratyrate_rateable "good"
end
