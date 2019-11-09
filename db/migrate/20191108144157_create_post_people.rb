class CreatePostPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :post_people do |t|
      t.integer :post_person

      t.timestamps
    end
  end
end
