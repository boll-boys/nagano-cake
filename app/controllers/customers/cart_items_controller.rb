class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total_price= @cart_items.sum { |cart_item| cart_item.item.price * cart_item.amount }

  end

	def update
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    @price = sub_total(@cart_item).to_s(:delimited)
    @cart_items = current_cart
    @total = amount(@cart_items).to_s(:delimited)
    # redirect_to customers_cart_items_path
	end

	def create
    @cart_item = CartItem.new(params_cart_item)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path

	end

	def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
	end

	def destroy
    @cart_item.destroy
    @cart_items = current_cart
    @total = total_price(@cart_items).to_s(:delimited)
    # respond_to do |format|
    #   format.html{ redirect_to customers_cart_items_path }
    #   format.js
    # end
    # redirect_to customers_cart_items_path
	end

  private

  def params_cart_item
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
