class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
     if  @customer.update(customer_params)
    redirect_to  admin_customer_path(@customer.id)
     else
    render edit_admin_customer_path
     end
  end

private

  def customer_params
    params.require(:customer).permit(:fist_name, :last_name,:fist_name_kana, :last_name_kana, :email, :address, :phon_number, :postal_code, :is_deleted)
  end
 
  def if_not_admin
    redirect_to root_path unless current_.admin?
  end
end