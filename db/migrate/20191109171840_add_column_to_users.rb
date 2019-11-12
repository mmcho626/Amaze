class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image_id, :string
    add_column :users, :user_introduction, :text
    add_column :users, :user_age, :integer
    add_column :users, :user_gender, :integer
    add_column :users, :name, :string
  end
end
