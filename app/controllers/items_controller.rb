class ItemsController < ApplicationController

  before_action :authenticate_admin!, only: [ :create, :update ] #管理者権限付与


  #他の機能実装のため、一旦こちらで仮実装。
  def create
    @item = Item.new(item_params)
    if @item.save
	    flash[:notice] = "保存しました."
	    redirect_to admins_items_path
    else
	    flash[:notice] = "保存できませんでした.すでに投稿されている可能性があります."
	    redirect_to new_admins_item_path
    end
  end


  def index
    # kaminari。１０件ずつ表示。
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @posts = @item.posts
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "更新しました."
      redirect_to admins_item_path(@item)
    else
      flash[:notice] = "更新されませんでした."
      redirect_to edit_admins_item_path(@item)
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_image_id, :item_body, :price, :category, :person, :time)
  end

end
