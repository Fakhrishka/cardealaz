class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :model
      t.integer :test_drive

      t.timestamps
    end
  end
end
