class ItemsController < ApplicationController

  before_action :authenticate_admin!, only: [ :create, :update ] #管理者権限付与


  #他の機能実装のため、一旦こちらで仮実装。
  def create
    @item = Item.new(item_params)
    if @item.save
	    flash[:notice] = "保存しました."
	    redirect_to admins_items_path
    else
	    flash[:notice] = "保存できませんでした."
	    redirect_to new_admins_item_path
    end


  # --------------create 開発途中の記述　エラー出るため一旦保留　ここから。--------------


  #投稿時、ボードゲーム名(item_name)が存在していた場合バリデーションがかかる。



  #   item = Item.item_exists?(params[:item_name])

  # if Item.item_exists?(params[:item_name])
  #   flash[:notice] = "既に存在するボードゲーム名です"
  #   redirect_to new_item_path
  # else
  #   @item = Item.new(item_params)
  #   @item.save
  #   flash[:notice] = "保存しました."
  #   redirect_to items_path
  # end

  #-------------- create 開発途中の記述　エラー出るため一旦保留　ここまで。--------------

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
      flash[:notice] = "更新できませんでした."
      redirect_to edit_admins_item_path(@item)
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_image_id, :item_body, :price, :category, :person, :time)
  end

end
