class AddTotalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total, :integer, default: 0
  end
end
