class AddStatusToTestdrive < ActiveRecord::Migration[6.1]
  def change
    add_column :test_drives, :status, :integer
  end
end
