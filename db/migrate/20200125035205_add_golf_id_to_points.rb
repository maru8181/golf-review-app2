class AddGolfIdToPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :points, :golf_id, :integer
  end
end
