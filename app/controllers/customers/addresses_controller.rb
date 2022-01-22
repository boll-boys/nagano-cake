class Customers::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addreeses =Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to request.referer
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code,:customer_id)
  end

end
