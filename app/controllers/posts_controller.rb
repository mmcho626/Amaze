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

      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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
