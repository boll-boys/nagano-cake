class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
     if @customer == current_customer
     else
     redirect_to customer_path(current_customer.id)
     end
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
     if  @customer.update(customer_params)
       flash[:notice] = "have updated customer successfully."
    redirect_to customer_path
     else
    render :edit
     end
  end
private
  
  def customer_params
    params.require(:customer).permit(:fist_name, :last_name, :email, :address, :phon_number, :postal_code)
  end
end