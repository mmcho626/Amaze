class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image #refileの記述

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy 

  belongs_to :age

  enum sex: { 未選択: 0, 男性: 1, 女性: 2 }

end
