class Customers::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses =Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to  addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code,:customer_id)
  end

end
