class CreateItemPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :item_people do |t|
      t.integer :item_person

      t.timestamps
    end
  end
end
