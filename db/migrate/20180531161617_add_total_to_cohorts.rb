class AddTotalToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :total, :integer, default: 0
  end
end
