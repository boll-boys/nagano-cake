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
     if  @customer.update(user_params)
       flash[:notice] = "have updated user successfully."
    redirect_to user_path(id)
     else
    render :edit
     end
  end
private
  
  def user_params
    params.require(:customer).permit(:fist_name, :last_name, :introduction)
  end
end