class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :item_id
      t.string :post1_image_id
      t.string :post2_image_id
      t.text :post_body
      t.float :star
      t.integer :post_category_id
      t.integer :post_person_id
      t.integer :post_time_id

      t.timestamps
    end
  end
end
