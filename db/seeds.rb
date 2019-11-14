# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PostCategory.create!(:post_category_name=>"カテゴリー1")
PostTime.create!(:post_time=>10)
PostPerson.create!(:post_person=>1)

5.times do |i|
	User.create!(:email=>"user#{i + 1}@com", :password=>"000000", :user_introduction=>"ユーザ紹介文#{i + 1}",:sex=>0, :name =>"ユーザ名", :age=>0)
end