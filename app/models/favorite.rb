class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :post
	#1人のユーザにつき、1つの投稿にいいねができる
	validates_uniqueness_of :post_id, scope: :user_id
end
