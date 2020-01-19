class ChangeDataGolfIdToTweets < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :golf_id, :bigint
  end
end
