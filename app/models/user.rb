class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image #refileの記述

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :favorited_posts, through: :favorites, source: :post
  #ユーザがどの投稿をいいねしているのか取得

  enum sex: { 未選択: 0, 男性: 1, 女性: 2 },_suffix: true
  enum age: { 未選択: 0, "10代": 1, "20代": 2, "30代": 3, "40代": 4, "50代": 5, "60代": 6, "70代": 7, "80代": 8, "90代": 9 },_suffix: true

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロー取得。Relationshipモデルのfollower_idにuser_idを格納

  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォロワー取得。followed_idにuser_idを格納

  has_many :following_user, through: :follower, source: :followed
  #following_userを命名。自分がフォローしているユーザ情報を取得。

  has_many :follower_user, through: :followed, source: :follower
  #自分をフォローしているユーザ情報を取得。


  #ユーザ一覧用

  # ユーザーをフォローする
  def follows(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollows(user_id)
    follower.find_by(followed_id: user_id).destroy
  end


  #ユーザ詳細用

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていれば(userが含まれていれば)trueを返す
  def following?(user)
    following_user.include?(user)
  end



  #検索機能
  def User.search(search, user_or_post_or_item)

    if user_or_post_or_item == "1"

       User.where(['name LIKE ?', "%#{search}%"]) #前方一致検索

    else

       User.all

    end

  end



  # バリデーション追加。


  # 値が空の場合エラー
  validates :email, :name, presence: true

  # ユーザ名　2〜20文字
  validates :name, length: { in:2..20 }

  # 自己紹介文　100字以内
  validates :user_introduction, length: { maximum: 100 }




end
