class Admin::OrdersController < ApplicationController

  def index
    @orders =Order.all
    @odrders = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end
  


end
