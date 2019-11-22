class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :post1_image_id
      t.string :post2_image_id
      t.text :post_body
      t.float :star

      t.timestamps
    end
  end
end
