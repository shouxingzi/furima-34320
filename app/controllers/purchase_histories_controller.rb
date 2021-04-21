class PurchaseHistoriesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only:[:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_history_destination = PurchaseHistoryDestination.new
  end

  def create
    @purchase_history_destination = PurchaseHistoryDestination.new(purchase_history_params)
    if @purchase_history_destination.valid?
      pay_item  
      @purchase_history_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_history_params
    params.require(:purchase_history_destination).permit(:postcode, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], price: @item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_history_params[:price],
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item.purchase_history != nil || current_user == @item.user
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
