class CreateItemTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_times do |t|
      t.integer :item_time

      t.timestamps
    end
  end
end
