class PostsController < ApplicationController

  def index
    @posts = Post.all
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @favorite = Favorite.new
    @user = User.find(params[:id])
  end


  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end


  def create
    @post = Post.new(post_params)

    #item追加機能ここから

    item = Item.search(params[:post_search_item]) #itemテーブルを参照。searchメソッドはitem.rbに記載。

    if item == nil #item_nameカラムの値が空の場合はその値をitemテーブルに追加
      @item = Item.new
      @item.item_name = params[:post_search_item]
      @item.save
      @post.item_id = @item.id
    else #値がitemテーブルに存在している場合はitem_idを登録
      @post.item_id = item.id
    end

    #item追加機能ここまで


    @post.user_id = current_user.id

      if @post.save
        redirect_to posts_path
      else
        redirect_to new_post_path
      end
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to post_path(@post)
    else
      flash[:notice] = "投稿内容を更新できませんでした"
      redirect_to edit_post_path(@post)
    end
  end


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
      params.require(:post).permit(:post1_image, :post2_image, :post_body, :star, :post_category_id, :post_person_id, :post_time_id)
    end
end
