class PurchaseHistoryDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message:"is invalid. Inclide hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/}
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    binding.pry
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)

  end
    
end
