class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items 
  has_many :order_details


  def add_tax_price
        (self.price * 1.08).round
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
