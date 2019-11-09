class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, :authentication_keys => [:login] #ログイン認証用キーをloginに設定


  #ログイン認証
  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup

  	if login = conditions.delete(:login)
  		where(conditions).where(["name_id = :value OR lower(email) = lower(:value)",{ :value => login }]).first
  	else
  		where(conditions).first
  	end
  end
end