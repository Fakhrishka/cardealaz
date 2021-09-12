class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :brand, null: false, foreign_key: true
      t.date :time
      t.string :person
      t.string :phone
      t.string :jobtype
      t.string :car

      t.timestamps
    end
  end
end
