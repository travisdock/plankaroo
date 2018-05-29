class AddDateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
    remove_column :events, :when, :datetime
  end
end
