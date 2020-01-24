class ChangeDataValuationToPoints < ActiveRecord::Migration[6.0]
  def change
    change_column :points, :valuation, :float
  end
end
