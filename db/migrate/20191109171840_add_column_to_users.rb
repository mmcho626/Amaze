class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image_id, :string
    add_column :users, :user_introduction, :text
    add_column :users, :age_id, :integer
    add_column :users, :sex, :integer
    add_column :users, :name, :string
  end
end
