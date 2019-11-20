class Item < ApplicationRecord

	has_many :posts

	belongs_to :item_category, optional: true #nilを許可
	belongs_to :item_person, optional: true #nilを許可
	belongs_to :item_time, optional: true #nilを許可


    # posts#create にて使用するメソッドの定義
    # 口コミ(post)の新規投稿時、item_nameカラムの値を検索
	def self.search(search)
    Item.find_by(['item_name LIKE ?', "#{search}"])
  	end

end
