class CreatePostTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_times do |t|
      t.integer :post_time

      t.timestamps
    end
  end
end
