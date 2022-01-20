class Item < ApplicationRecord
  attachment :item_image
  belongs_to :genre
end
