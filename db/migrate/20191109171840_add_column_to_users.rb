class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image, :string
    add_column :users, :user_introduction, :text
    add_column :users, :user_age, :string
    add_column :users, :user_gender, :string
  end
end
