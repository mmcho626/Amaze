class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @favorite = Favorite.new
    @user = User.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
      if @post.save!
        redirect_to posts_path
      else
        redirect_to new_post_path
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "投稿内容を更新しました"
        redirect_to post_path(@post)
      else
        @post = Post.find
        flash[:notice] = "投稿内容を更新できませんでした"
        redirect_to edit_post_path(@post)
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def favorites
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:item_id, :post1_image, :post2_image, :post_body, :star, :post_category_id, :post_person_id, :post_time_id)
    end
end
