class Post < ApplicationRecord
	attachment :post_image #refileの記述

	belongs_to :user, optional: true #一時的にnilを許可
	has_many :comments, dependent: :destroy
end
