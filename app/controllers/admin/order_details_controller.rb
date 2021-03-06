class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if params[:order_detail][:making_status] == "in_production"
      @order_detail.order.status = "in_production"
      @order_detail.order.save
    elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "complete_production").count
      @order_detail.order.status = "preparing_ship"
      @order_detail.order.save
    end
      redirect_to request.referer
  end  
  
  private 
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
