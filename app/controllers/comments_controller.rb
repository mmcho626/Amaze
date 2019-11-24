class CommentsController < ApplicationController

  before_action :authenticate_user!, only:[ :create ] #ユーザ権限付与
  before_action :correct_user, only:[ :destroy ] #正しいユーザーでない時、トップページにリダイレクト

  def create
  	post = Post.find(params[:post_id])
  	comment = current_user.comments.new(comment_params)
  	comment.post_id = post.id
  	comment.save
  	redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    comment = current_user.comments.find_by(post_id: post.id)
    if comment.destroy
      flash[:notice]= "コメントを削除しました"
      redirect_to post_path(post)
    else
      flash[:notice]= "コメントを削除できませんでした"
      redirect_to post_path(post)
    end
  end


  private

	  def comment_params
	  	params.require(:comment).permit(:user_id, :post_id, :comment)
	  end

end
