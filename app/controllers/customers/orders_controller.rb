class Customers::OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    #binding.pry
    @order = current_customer.orders.new(order_params)
    @order.shipping_cost = 800
    #status = enumで定義したやつを入れてあげる
    if @order.save
      #binding.pry
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
        #making_status = enumで定義したやつを入れてあげる
        order_detail.save
      end
      cart_items.destroy_all
      redirect_to complete_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
      if params[:order][:address_number] == "1"
        @order.name = current_customer.fist_name + current_customer.last_name
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

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order =Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_payment, :payment_method, :postal_code)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end