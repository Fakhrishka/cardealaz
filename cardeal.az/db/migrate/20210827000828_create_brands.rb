class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.references :distributor, null: false, foreign_key: true
      t.string :name
      t.string :moto

      t.timestamps
    end
  end
end
