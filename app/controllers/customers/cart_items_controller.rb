class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = current_cart
  end

	def update
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    @price = sub_price(@cart_item).to_s(:delimited)
    @cart_items = current_cart
    @total = total_price(@cart_items).to_s(:delimited)
    # redirect_to customers_cart_items_path
	end

	def create
    @cart_item = current_customer.cart_items.new(params_cart_item)

      # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
    @update_cart_item =  CartItem.find_by(item: @cart_item.item)
    if @update_cart_item.present? && @cart_item.valid?
        @cart_item.amount += @update_cart_item.amount
        @update_cart_item.destroy
    end

    if @cart_item.save
      redirect_to items_path
    else
      @item = item.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      render ("customer/items/show")
    end
	end

	def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to customers_cart_items_path
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
