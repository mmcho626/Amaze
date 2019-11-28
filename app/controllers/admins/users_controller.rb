class Admins::UsersController < ApplicationController

  before_action :authenticate_admin! #管理者権限付与

  def index
    # kaminari。１０件ずつ表示。
    @users = User.all.page(params[:page]).per(10)
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
