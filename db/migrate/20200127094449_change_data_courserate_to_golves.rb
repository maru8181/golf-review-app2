class ChangeDataCourserateToGolves < ActiveRecord::Migration[6.0]
  def change
    change_column :golves, :courserate, :float
  end
end
