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
    @user = @post.user
    @item = @post.item
    render 'posts/show'
  end


  def edit
    @post = Post.find(params[:id])
    render 'posts/edit'
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
