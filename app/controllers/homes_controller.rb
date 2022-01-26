class HomesController < ApplicationController
  def top
    @items = Item.all
    @items = @items.shuffle[0..3]
  end

  def about
  end

end
