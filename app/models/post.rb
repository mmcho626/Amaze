class Post < ApplicationRecord
	#refileの記述
	attachment :post1_image
	attachment :post2_image

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	has_many :favorited_users, through: :favorites, source: :user
	#投稿が誰にいいねされているのかを取得

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end


    #検索機能
    def Post.search(search, user_or_post)
	  if user_or_post == "2"
	     Post.where(['post_body LIKE ?', "%#{search}%"]) #前方一致検索
	  else
	     Post.all
	  end
	end

end
