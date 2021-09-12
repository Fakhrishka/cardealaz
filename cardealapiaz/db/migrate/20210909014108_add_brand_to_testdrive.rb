class AddBrandToTestdrive < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_drives, :brand, foreign_key: true
  end
end
