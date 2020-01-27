class AddCourserateToGolves < ActiveRecord::Migration[6.0]
  def change
    add_column :golves, :courserate, :integer
  end
end
