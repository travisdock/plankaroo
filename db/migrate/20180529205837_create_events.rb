class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :when
      t.string :where

      t.timestamps
    end
  end
end
