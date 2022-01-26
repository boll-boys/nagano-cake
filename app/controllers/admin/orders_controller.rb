class Admin::OrdersController < ApplicationController

  def index
    @orders =Order.all.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details =@order.order_details
    
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if params[:order][:status] == "payment_confirmation"
        @order_details.each do |order_detail|
          order_detail.making_status = "waiting_production"
          order_detail.save
        end
        
      end
        redirect_to request.referer
    end
  end
  
private
  def order_params
    params.require(:order).permit(:status)
  end


end
