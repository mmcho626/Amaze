# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ItemCategory.create!(:item_category_name=>"アイテムカテゴリー")
ItemTime.create!(:item_time=>20)
ItemPerson.create!(:item_person=>2)


5.times do |i|
	User.create!(:email=>"user#{i + 1}@com", :password=>"000000", :user_introduction=>"ユーザ紹介文#{i + 1}",:sex=>0, :name =>"ユーザ名", :age=>0)
end

# 管理者ログイン情報
Admin.create(:email => "admin@com", :password=>"000000")
