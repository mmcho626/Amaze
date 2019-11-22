class Item < ApplicationRecord

	has_many :posts

	belongs_to :item_category, optional: true #nilを許可
	belongs_to :item_person, optional: true #nilを許可
	belongs_to :item_time, optional: true #nilを許可


	#refileの記述
	attachment :item_image


    # posts#create にて使用するメソッドの定義
    # 口コミ(post)の新規投稿時、item_nameカラムの値を検索
	def self.search(search)
	    Item.find_by(['item_name LIKE ?', "#{search}"])
  	end


  #-------------- create 開発途中の記述　エラー出るため一旦保留　ここから。--------------

    #admins::items#create にて使用するメソッドを定義
	#投稿時、ボードゲーム名(item_name)が存在していた場合バリデーションがかかる。


  	# def self.item_exists?(search)
  	# 	Item.where(['item_name LIKE ?', "#{search}"]).exists?
  	# end


  #-------------- create 開発途中の記述　エラー出るため一旦保留　ここまで。--------------



end
