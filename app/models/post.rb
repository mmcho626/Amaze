class Post < ApplicationRecord
	attachment :post_image #refileの記述

	belongs_to :user
	has_many :comments, dependent: :destroy
end
