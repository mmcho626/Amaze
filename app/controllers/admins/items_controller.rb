class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
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
