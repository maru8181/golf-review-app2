class CreateGolves < ActiveRecord::Migration[6.0]
  def change
    create_table :golves do |t|
      t.string :name
      t.string :place

      t.timestamps
    end
  end
end
