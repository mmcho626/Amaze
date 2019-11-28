class Admins::ItemsController < ApplicationController

  before_action :authenticate_admin! #管理者権限付与

  def new
    @item = Item.new
  end

  def index
    # kaminari。１０件ずつ表示。
    @items = Item.all.page(params[:page]).per(10)
    render 'items/index'
  end

  def show
    @item = Item.find(params[:id])
    @posts = @item.posts
    render 'items/show'
  end

  def edit
    @item = Item.find(params[:id])
  end


  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admins_items_path
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_image_id, :item_body, :price, :category, :person, :time)
  end


end
