class Post < ApplicationRecord
	#refileの記述
	attachment :post1_image
	attachment :post2_image

	belongs_to :user, optional: true #一時的にnilを許可
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

end
