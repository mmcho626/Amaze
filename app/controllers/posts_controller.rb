class PostsController < ApplicationController

  before_action :authenticate_user!, only: [ :new, :create ] #ユーザ権限付与
  before_action :correct_user, only: [ :edit ] #正しいユーザーでない時、トップページにリダイレクト

  def index
    # kaminari。１０件ずつ表示。
    @posts = Post.all.page(params[:page]).per(10)
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @favorite = Favorite.new
    @user = @post.user
    @item = @post.item
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

    item = Item.search_all(params[:search_item]) #itemテーブルを参照。searchメソッドはitem.rbに記載。

    if item == nil #item_nameカラムの値が空の場合はその値をitemテーブルに追加
      @item = Item.new
      @item.item_name = params[:search_item]
      @item.save
      @post.item_id = @item.id
    else #値がitemテーブルに存在している場合はitem_idを登録
      @post.item_id = item.id
    end

    #item追加機能ここまで


    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      flash[:notice] = "投稿できませんでした"
      redirect_to new_post_path
    end
  end


  def update

    @post = Post.find(params[:id])


    if user_signed_in? # ユーザログイン時

      if @post.update(post_params)
        flash[:notice] = "投稿内容を更新しました"
        redirect_to post_path(@post)
      else
        flash[:notice] = "投稿内容を更新できませんでした"
        redirect_to edit_post_path(@post)
      end

    elsif admin_signed_in? #管理者ログイン時

      if @post.update(post_params)
        flash[:notice] = "投稿内容を更新しました"
        redirect_to admins_post_path(@post)
      else
        flash[:notice] = "投稿内容を更新できませんでした"
        redirect_to admins_edit_post_path(@post)
      end


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
      params.require(:post).permit(:post1_image, :post2_image, :post_body)
    end


    def correct_user
      @post = Post.find(params[:id])
      @user = @post.user
      if @user != current_user
        redirect_to user_path(@user.id)
      end
    end

    def correct_admin
      @admin = Admin.find(params[:id])
      if @admin != current_admin
        redirect_to new_admin_session_path
      end
    end


end
