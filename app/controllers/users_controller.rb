class UsersController < ApplicationController
  def index
  end

  def show
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
    params.require(:user).permit(:email, :user_image)
  end

end
