class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :status

  with_options presence: true do
    validates :product_name
    validates :description
    validates :image 
    validates :price, format: { with: /\A[3-9][0-9]{2}|[1-9][0-9]{3,6}\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
