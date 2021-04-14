class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)                                  
  end

  def move_to_index
    if current_user != @item.user
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
