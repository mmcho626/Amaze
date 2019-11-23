class Admins::PostsController < ApplicationController

  before_action :authenticate_admin!


  def index
    @posts = Post.all
    render 'posts/index'
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @favorite = Favorite.new
    @user = User.find(params[:id])
    render 'posts/show'
  end


  def edit
    @post = Post.find(params[:id])
    render 'posts/edit'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to admins_post_path(@post)
    else
      flash[:notice] = "投稿内容を更新できませんでした"
      redirect_to admins_edit_post_path(@post)
    end
  end


  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admins_posts_path
  end


  def favorites
    @post = Post.find(params[:id])
  end


  private

    def post_params
      params.require(:post).permit(:post1_image, :post2_image, :post_body, :star, :post_category_id, :post_person_id, :post_time_id)
    end
end
