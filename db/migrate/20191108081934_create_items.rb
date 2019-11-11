class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_image_id
      t.text :item_body
      t.integer :price
      t.integer :item_category_id
      t.integer :item_person_id
      t.integer :item_time_id

      t.timestamps
    end
  end
end
