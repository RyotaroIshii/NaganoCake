class Public::ItemsController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end

end
