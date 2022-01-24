class Admin::CustomersController < ApplicationController
  def index
    @customer = Customers.all
  end
end
