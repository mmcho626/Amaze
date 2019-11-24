class RelationshipsController < ApplicationController

  before_action :authenticate_user!, only: [ :follows, :follow ] #ユーザ権限付与
  before_action :correct_user, only: [ :unfollows, :unfollow  ] #正しいユーザーでない時、トップページにリダイレクト

    #ユーザ一覧用
	def follows
	  current_user.follows(params[:id])
	  redirect_to users_path
	end

	def unfollows
	  current_user.unfollows(params[:id])
	  redirect_to users_path
	end

    #ユーザ詳細用
	def follow
	  current_user.follow(params[:id])
	  redirect_to user_path
	end

	def unfollow
	  current_user.unfollow(params[:id])
	  redirect_to user_path
	end

end
