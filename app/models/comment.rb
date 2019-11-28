class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post


	# バリデーション追加。


	# 値が空の場合エラー
	[ :post_id, :user_id, :comment ].each do |v|

		validates v, presence: true

	end

	# コメント本文（post_body）は 100字以上
	validates :comment, length: { minimum: 100 }


end
