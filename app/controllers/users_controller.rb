class UsersController < ApplicationController

  before_action :correct_user, only: [ :edit, :update ] #ユーザ権限付与

  def index
    # kaminari。１０件ずつ表示。
    @users = User.all.page(params[:page]).per(10)
    @users_count = User.all.count
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    if admin_signed_in? #管理者ログイン時

      @user = User.find(params[:id])
      if  @user.update(user_params)
        flash[:notice] = "保存しました"
        redirect_to admins_user_path(@user.id)
      else
        flash[:notice] = "保存できませんでした"
        redirect_to edit_admins_user_path(@user.id)
      end

    else #管理者ログアウト時

      @user = User.find(params[:id])
      if  @user.update(user_params)
        flash[:notice] = "保存しました"
        redirect_to user_path(@user.id)
      else
        flash[:notice] = "保存できませんでした"
        redirect_to edit__user_path(@user.id)
      end

    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


  def favorites
    @user = User.find(params[:id])
  end

  def follower
    @user = User.find(params[:id])
    render 'show_follow'
  end

  def followed
    @user = User.find(params[:id])
    render 'show_follower'
  end


  #検索機能
  def search
    @user_or_post_or_item = params[:option]

    if @user_or_post_or_item == "1"

      @users = User.search(params[:search], @user_or_post_or_item)
      # Userモデルのsearchメソッドはuser.rbに記載。
      @search_users_count = @users.count

    elsif @user_or_post_or_item == "2"

      @posts = Post.search(params[:search], @user_or_post_or_item)
      # Postモデルのsearchメソッドはpost.rbに記載。
      @search_posts_count = @posts.count

    else
      @items = Item.search(params[:search], @user_or_post_or_item)
      # Itemモデルのsearchメソッドはitem.rbに記載。
      @search_items_count = @items.count
    end
  end

  private


  def user_params
    params.require(:user).permit(:email, :user_image, :name, :sex, :age, :user_introduction )
  end


  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user.id)
    end
  end


end
