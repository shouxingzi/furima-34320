class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_destination = PurchaseHistoryDestination.new
  end

  def create
    @purchase_history_destination = PurchaseHistoryDestination.new(purchase_history_params)
    if @purchase_history_destination.valid?
      @purchase_history_destination.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def purchase_history_params
    params.require(:purchase_history_destination).permit(:postcode, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
