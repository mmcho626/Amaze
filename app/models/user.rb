class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image #refileの記述

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum sex: { 未選択: 0, 男性: 1, 女性: 2 },_suffix: true
  enum age: { 未選択: 0, "10代": 1, "20代": 2, "30代": 3, "40代": 4, "50代": 5, "60代": 6, "70代": 7, "80代": 8, "90代": 9 },_suffix: true
end
