class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)                                  
  end

end
