class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.string :item_category_name

      t.timestamps
    end
  end
end
