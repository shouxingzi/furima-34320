class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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
    validates :category_id, format: { with: /\A[2-9]|1[0-1]\z/ }
    validates :status_id, format: { with: /\A[2-7]\z/ }
    validates :postage_id, format: { with: /\A[2-3]\z/ }
    validates :prefecture_id, format: { with: /\A[2-9]|[1-3][0-9]|4[0-8]\z/ }
    validates :shipping_day_id, format: { with: /\A[2-4]\z/ }
    validates :price, format: { with: /\A[3-9][0-9]{2}|[1-9][0-9]{3,6}\z/ }
  end
end
