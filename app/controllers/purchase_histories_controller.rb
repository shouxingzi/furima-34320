class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_destination = PurchaseHistoryDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_destination = PurchaseHistoryDestination.new(purchase_history_params)
    if @purchase_history_destination.valid?
      pay_item  
      @purchase_history_destination.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
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
      amount: purchase_history_params[:price],  # 商品の値段
      card: purchase_history_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
