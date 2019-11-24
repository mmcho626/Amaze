class FavoritesController < ApplicationController

  before_action :authenticate_user!, only:[ :create ] #ユーザ権限付与
  before_action :correct_user, only:[ :destroy ] #正しいユーザーでない時、トップページにリダイレクト

  def create
    post = Post.find(params[:post_id])
  	favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
  	redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
  	favorite = current_user.favorites.find_by(post_id: post.id)
  	favorite.destroy
  	redirect_to post_path(post)
  end
end
