class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
     if @customer == current_customer
     else
     redirect_to my_page_path
     end
  end

  def edit
    @customer = Customer.find(params[:id])
     if @customer == current_customer
     else
     redirect_to my_page_path
     end
  end

  def quit
    @customer = Customer.find(params[:id])
  end

  def out
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
    @customer = Customer.find(params[:id])
     if  @customer.update(customer_params)
       flash[:notice] = "have updated customer successfully."
    redirect_to my_page_path
     else
    render :edit
     end
  end
private

  def customer_params
    params.require(:customer).permit(:fist_name, :last_name,:fist_name_kana, :last_name_kana, :email, :address, :phon_number, :postal_code)
  end
end