class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :user_type
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
