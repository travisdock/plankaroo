class AddRecordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :best, :integer, default: 0
  end
end
