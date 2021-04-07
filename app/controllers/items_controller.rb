class ItemsController < ApplicationController
  
  def index
  end

  def new
    #@product = Product.new
    @index = Product.new

  end

  def create
    #@product = Product.new(product_params)
    #@product.save
    @index = Product.new(product_params)
    @index.save

  end

  private
  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)                                  
  end
  
end
