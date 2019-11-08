class CreateItemPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :item_people do |t|
      t.integer :item_people

      t.timestamps
    end
  end
end
