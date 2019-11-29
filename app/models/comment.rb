class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post


	# バリデーション追加。


	# 値が空の場合エラー
	[ :post_id, :user_id, :comment ].each do |v|

		validates v, presence: true

	end

	# コメント本文（post_body）は 500字以内
	validates :comment, length: { maximum: 500 }


end
