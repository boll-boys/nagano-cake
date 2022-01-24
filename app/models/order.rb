class Order < ApplicationRecord

  has_many :order_details
  
  enum_status: { }
end
