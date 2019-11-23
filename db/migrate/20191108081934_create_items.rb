class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_image_id
      t.text :item_body
      t.integer :price
      t.integer :category
      t.integer :person
      t.integer :time

      t.timestamps
    end
  end
end
