class Post < ApplicationRecord

	#refileの記述
	attachment :post1_image
	attachment :post2_image

	belongs_to :item

	belongs_to :user

	has_many :comments, dependent: :destroy

	has_many :favorites, dependent: :destroy

	has_many :favorited_users, through: :favorites, source: :user
	#投稿が誰にいいねされているのかを取得

    def favorited_by?(user)

      favorites.where(user_id: user.id).exists?

    end


    #検索機能
    def Post.search(search, user_or_post_or_item)

	  if user_or_post_or_item == "2"

	     Post.where(['post_body LIKE ?', "%#{search}%"]) #前方一致検索

	  else

	     Post.all

	  end

	end



	# バリデーション追加。


	# 値が空の場合エラー
	[ :item_id, :user_id, :post_body ].each do |v|

		validates v, presence: true

	end

	# 口コミ本文（post_body）は 1000字以内
	validates :post_body, length: { maximum: 1000 }


end
