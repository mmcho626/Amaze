class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "保存しました"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "保存できませんでした"
      render :edit
    end

  end

  def destroy
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

  private

  def user_params
    params.require(:user).permit(:email, :user_image, :name, :sex, :age, :user_introduction )
  end

end
