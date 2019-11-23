class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
    render 'users/index'
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    render 'users/show'
  end

  def edit
    @user = User.find(params[:id])
    render 'users/edit'
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:email, :user_image, :name, :sex, :age, :user_introduction )
  end

end
