class CreateCarData < ActiveRecord::Migration[6.1]
  def change
    create_table :car_data do |t|
      t.references :car, null: false, foreign_key: true
      t.integer :price
      t.string :name
      t.integer :engine

      t.timestamps
    end
  end
end
