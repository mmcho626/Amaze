class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
  end

  def destroy
  end

  def follower
    @user = User.find(params[:id])
    render 'show_follow'
  end

  def followed
    @user = User.find(params[:id])
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_image, :name, :sex, :age_id, :user_introduction )
  end

end
