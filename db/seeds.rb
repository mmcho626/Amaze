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
User.create!(:email=>"user1@com", :password=>"000000", :user_introduction=>"紹介文１",:sex=>0, :name =>"ユーザ名",:age_id=>1)



age = [1,2,3,4,5,6,7,8,9]

age.each do |i|
	Age.create!(age: "#{i*=10}代")
end
