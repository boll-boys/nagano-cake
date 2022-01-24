class Customers::OrdersController < ApplicationController


  def new
    @order = Order.new
    # @address = current_customer.address
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.order_amount = cart.amount
        order_item.order_price = cart.item.price
        order_item.save
      end
      redirect_to complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
      if params[:order][:address_number] == "1"
         @order.name = current_customer.fist_name
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code
      elsif params[:order][:address_number] == "2"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.name = @address.name
        @order.address =@address.address
      elsif params[:order][:address_number] == "3"
        @order.postal_code =params[:order][:postal_code]
        @order.name = params[:order][:address_name]
        @order.address = params[:order][:address]
      else
      redirect_to confirm_path
      end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }

  end
  def complete
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_payment, :payment_method)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end