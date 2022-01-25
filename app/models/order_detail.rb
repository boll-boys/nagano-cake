class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :items

  enum making_status: { not_startable: 0, waiting_production: 1, in_production: 2, complete_production: 3 }
end
