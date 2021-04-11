class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end



  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)                                  
  end
  
end
