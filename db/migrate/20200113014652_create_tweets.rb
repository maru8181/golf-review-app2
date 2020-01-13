class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.integer :golf_id
      t.integer :point_id
      t.text :text

      t.timestamps
    end
  end
end
