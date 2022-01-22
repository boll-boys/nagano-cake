class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
    @genre =Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render action: :edit
    end
  end

  private
  def  item_params
    params.require(:item).permit(:name, :image_id, :description, :genre_id, :price, :is_active)
  end



end
