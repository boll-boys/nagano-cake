class Customers::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @items = Item.all
    @item =Item.find(params[:id])
    @item
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :is_active, :description)
  end
end
