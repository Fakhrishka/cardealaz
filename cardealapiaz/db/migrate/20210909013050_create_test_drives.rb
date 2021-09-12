class CreateTestDrives < ActiveRecord::Migration[6.1]
  def change
    create_table :test_drives do |t|
      t.references :car, null: false, foreign_key: true
      t.string :person
      t.string :phone
      t.string :personid
      t.date :time

      t.timestamps
    end
  end
end
