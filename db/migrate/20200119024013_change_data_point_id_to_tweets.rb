class ChangeDataPointIdToTweets < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :point_id, :bigint
  end
end
