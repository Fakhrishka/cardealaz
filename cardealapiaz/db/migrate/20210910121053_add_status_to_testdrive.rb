class AddStatusToTestdrive < ActiveRecord::Migration[6.1]
  def change
    add_column :testdrives, :status, :integer
  end
end
