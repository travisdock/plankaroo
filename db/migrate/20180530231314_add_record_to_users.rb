class AddRecordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :record, :integer, default: 0
  end
end
