class Item < ApplicationRecord

	has_many :posts


	#refileの記述
	attachment :item_image


	enum category: { "": 0, "エリアマジョリティ": 1, "デッキビルディング": 2, "トリックテイキング": 3, "ワーカープレイスメント":4, "オークション":5, "ダイスロール":6, "正体隠匿":7, "ワードゲーム":8 },_suffix: true

	enum time: { "": 0, "5-15分": 1, "15-30分": 2, "30分-45分": 3, "45分-60分":4, "60-90分":5, "90-120分":6, "120分以上":7 },_suffix: true

	enum person: { "": 0, "1人用": 1, "2人用": 2, "2人以下": 3, "3人以下":4, "4人以下":5, "5人以下":6, "6人以下":7, "7人以下":8, "8人以上〜":9 },_suffix: true

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
