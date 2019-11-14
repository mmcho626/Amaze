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

  private

  def user_params
    params.require(:user).permit(:email, :user_image, :name, :sex, :age_id, :user_introduction )
  end

end
