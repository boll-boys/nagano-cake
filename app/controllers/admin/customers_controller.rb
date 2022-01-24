class Admin::CustomersController < ApplicationController
  def index
    @customer = Customers
  end
end
